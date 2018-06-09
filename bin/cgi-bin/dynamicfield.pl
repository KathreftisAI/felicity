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

my $type = $cgi->param('type');
my $queue = $cgi->param('queue');
use Kernel::System::ObjectManager;
local $Kernel::OM = Kernel::System::ObjectManager->new();
    
#Get all the dynamic fields in array to send in response based on requested ID.
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    my $SQL ="SELECT id,name FROM dynamic_field WHERE valid_id =1";

    return if !$DBObject->Prepare(SQL => $SQL);
    my %DynamicFields;
    while ( my @Data = $DBObject->FetchrowArray() ) {
	$DynamicFields{$Data[0]} = $Data[1];
    }


#Fetch the record from DB based on Type and Queue ID requsted.
   my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
   my $SQL ="SELECT id,field_name,content FROM dynamic_custom_content 
   WHERE (type='".$type."') and (queue = '".$queue."') and valid_id=1";

   my %result;
   return if !$DBObject->Prepare(SQL => $SQL);
   while ( my @Row = $DBObject->FetchrowArray() ) {
   my $field_name = $DynamicFields{$Row[1]};
   	%result->{$Row[0]}= {'field_name' => $field_name,'content' => $Row[2]}; 	
   }
    my $json_str = encode_json(\%result);
    print $json_str;
   

