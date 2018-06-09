#!/usr/bin/perl
# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU AFFERO General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
# or see http://www.gnu.org/licenses/agpl.txt.
# --
print "Content-type: text/html\n\n";
               
#Code to get Queue List
#Author: Tuere
#Date: 11/7/2017
#
use strict;
use warnings;

use JSON;
use CGI;
use Data::Dumper;




# use ../../ as lib location
use FindBin qw($Bin);
use lib "$Bin/../..";
use lib "$Bin/../../Kernel/cpan-lib";
use lib "$Bin/../../Custom";

# 0=off;1=on;
my $Debug = 0;

my $cgi = CGI->new;

#my $queuetypeid = $cgi->param('type');


#my @tempid = split(/\|\|/,$queuetypeid);

#my $queueid = $tempid[0];
 
use Kernel::System::ObjectManager;
local $Kernel::OM = Kernel::System::ObjectManager->new();
    
#Get queue names from database.
    my $count;

    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    my $SQL ="SELECT name,id FROM queue";

    return if !$DBObject->Prepare(SQL => $SQL);
    my @QueueArray;
    my @QueueIDs;
    $count = 0;
    while ( my @Data = $DBObject->FetchrowArray() ) {
	$QueueArray[$count] = $Data[0];
        $QueueIDs[$count] = $Data[1];
        $count++;
    }

   my %result;my $i; my @temp;
# Array Iterator
   for ($i=0;$i<$count;$i++){
	my $x = "::";

	my @c = $QueueArray[$i] =~ /$x/g;
        my $count = @c;
        @temp = split(/::/,$QueueArray[$i]);
        my $tempID = $QueueIDs[$i]."||".$QueueArray[$i];
        if($count <= 2){
        	if($count == 2){
			$result{$QueueIDs[$i]}{"SubCategory"}=$temp[2];
                        $result{$QueueIDs[$i]}{"ParentLevel"}="2";
                }
                if($count > 0){
			$result{$QueueIDs[$i]}{"Category"}=$temp[1];
                }
		$result{$QueueIDs[$i]}{"TypeID"}=$tempID;
                $result{$QueueIDs[$i]}{"Type"}=$temp[0];
                
		if($count == 0){
			$result{$QueueIDs[$i]}{"ParentLevel"}="0";
		}
                if($count == 1){
			$result{$QueueIDs[$i]}{"ParentLevel"}="1";
		}
	} 
   }
# End of Array Iterator
   my $json_str = encode_json(\%result);
   print $json_str;
