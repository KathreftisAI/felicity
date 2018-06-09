# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
#  Note:
#
#  -->> Most OTRS configuration should be done via the OTRS web interface
#       and the SysConfig. Only for some configuration, such as database
#       credentials and customer data source changes, you should edit this
#       file. For changes do customer data sources you can copy the definitions
#       from Kernel/Config/Defaults.pm and paste them in this file.
#       Config.pm will not be overwritten when updating OTRS.
# --

package Kernel::Config;

use strict;
use warnings;
use utf8;

sub Load {
    my $Self = shift;

    # ---------------------------------------------------- #
    # database settings                                    #
    # ---------------------------------------------------- #

    # The database host
    $Self->{'DatabaseHost'} = '172.17.0.3';

    # The database name
    $Self->{'Database'} = "felicity_opensource";

    # The database user
    $Self->{'DatabaseUser'} = "root";

# The password of database user. You also can use bin/otrs.Console.pl Maint::Database::PasswordCrypt
# for crypted passwords
    $Self->{'DatabasePw'} = 'Redhat@123';

    # The database DSN for MySQL ==> more: "perldoc DBD::mysql"
    $Self->{'DatabaseDSN'}
        = "DBI:mysql:dbname=$Self->{Database};host=$Self->{DatabaseHost}";

    $Self->{'Customer::AuthModule'} = 'Kernel::System::CustomerAuth::DB';
    $Self->{'Customer::AuthModule::DB::Table'}            = 'customer_user';
    $Self->{'Customer::AuthModule::DB::CustomerKey'}      = 'login';
    $Self->{'Customer::AuthModule::DB::CustomerPassword'} = 'pw';

    # ---------------------------------------------------- #
    # fs root directory
    # ---------------------------------------------------- #
    $Self->{Home} = '/opt/Felicity';

    # ---------------------------------------------------- #
    # insert your own config settings "here"               #
    # config settings taken from Kernel/Config/Defaults.pm #
    # ---------------------------------------------------- #
    # $Self->{SessionUseCookie} = 0;
    # $Self->{CheckMXRecord} = 0;

    # ScriptAlias
    # Prefix to index.pl used as ScriptAlias in web config
    # (Used when emailing links to agents).
    $Self->{ScriptAlias} = 'felicity/';

    # Frontend::WebPath
    # (URL base path of icons, CSS and Java Script.)
    $Self->{'Frontend::WebPath'} = '/felicity-web/';

    # ---------------------------------------------------- #

    # ---------------------------------------------------- #
    # data inserted by installer                           #
    # ---------------------------------------------------- #
    # $DIBI$

    # ---------------------------------------------------- #
    # ---------------------------------------------------- #
    #                                                      #
    # end of your own config options!!!                    #
    #                                                      #
    # ---------------------------------------------------- #
    # ---------------------------------------------------- #
}

# ---------------------------------------------------- #
# needed system stuff (don't edit this)                #
# ---------------------------------------------------- #

use Kernel::Config::Defaults;    # import Translatable()
use base qw(Kernel::Config::Defaults);

# -----------------------------------------------------#

1;
