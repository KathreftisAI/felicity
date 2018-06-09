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

my $pname = $cgi->param('pname');
my $cname = $cgi->param('cname');


my $qq = $pname."::".$cname;
#my @tempid = split(/\|\|/,$queuetypeid);

#my $queueid = $tempid[0];
 
use Kernel::System::ObjectManager;
local $Kernel::OM = Kernel::System::ObjectManager->new();
    
#Get queue names from database.
    my $counter;

    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    my $SQL ="SELECT name,id FROM queue WHERE name LIKE'%".$qq."%'";

    return if !$DBObject->Prepare(SQL => $SQL);
    my @QueueArray;
    my @QueueIDs;
    $counter = 0;
    while ( my @Data = $DBObject->FetchrowArray() ) {
	$QueueArray[$counter] = $Data[0];
        $QueueIDs[$counter] = $Data[1];
        $counter++;
    }

   my %result;my $i; my @temp;
# Array Iterator
   for ($i=0;$i<$counter;$i++){
	my $x = "::";

	my @c = $QueueArray[$i] =~ /$x/g;
        my $count = @c;
        @temp = split(/::/,$QueueArray[$i]);
        my $tempID = $QueueIDs[$i]."||".$QueueArray[$i];
        if($count == 2){
        	$result{$QueueIDs[$i]}{"QID"}=$QueueIDs[$i];
                $result{$QueueIDs[$i]}{"QName"}=$QueueArray[$i];
		$result{$QueueIDs[$i]}{"SubCategory"}=$temp[2];
                $result{$QueueIDs[$i]}{"IDVal"}=$tempID;
                
	} 
   }
# End of Array Iterator
   my $json_str = encode_json(\%result);
   print $json_str;
