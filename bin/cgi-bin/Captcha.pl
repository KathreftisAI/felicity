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
               
#Code to get Captcha Token
#Author: Milan
#Date: 14/2/2018
#
use strict;
use warnings;

use JSON;
use CGI;
use Authen::Captcha;



# use ../../ as lib location
use FindBin qw($Bin);
use lib "$Bin/../..";
use lib "$Bin/../../Kernel/cpan-lib";
use lib "$Bin/../../Custom";

use Kernel::System::ObjectManager;
local $Kernel::OM = Kernel::System::ObjectManager->new();
my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

my $Debug = 0;

my $cgi = CGI->new;
    
# create a new object
my $captcha = Authen::Captcha->new();

# set the data_folder. contains flatfile db to maintain state
# set directory to hold publicly accessible images
$captcha = Authen::Captcha->new(
data_folder => $ConfigObject->Get('Home').'/var/httpd/htdocs/Captcha',
output_folder => $ConfigObject->Get('Home').'/var/httpd/htdocs/Captcha/http/image',
);

# create a captcha. Image filename is "$token.png"
my $token = $captcha->generate_code(5);

my $json_str = encode_json({
	result => $token
});
print $json_str;
