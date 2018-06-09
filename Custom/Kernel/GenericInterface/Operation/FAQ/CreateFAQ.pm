# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::GenericInterface::Operation::FAQ::CreateFAQ;

use strict;
use warnings;
use MIME::Base64;
use Kernel::System::VariableCheck qw(IsArrayRefWithData IsHashRefWithData IsStringWithData);
use Data::Dumper;
use base qw(
    Kernel::GenericInterface::Operation::Common
);

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Needed (qw( DebuggerObject WebserviceID )) {
        if ( !$Param{$Needed} ) {

            return {
                Success      => 0,
                ErrorMessage => "Got no $Needed!"
            };
        }

        $Self->{$Needed} = $Param{$Needed};
    }

    return $Self;
}


sub Run {
    my ( $Self, %Param ) = @_;
    
    # check needed hashes
    for my $Needed (qw(Title CategoryID StateID LanguageID ValidID)) {
        if (  !$Param{Data}->{$Needed}  ) {
            return $Self->ReturnError(
                ErrorCode    => 'CreateFAQ.MissingParameter',
                ErrorMessage => "CreateFAQ: $Needed parameter is missing or not valid!",
            );
        }
    }

    if ( !defined( $Param{Data}->{GetAttachmentContents} ) ) {
        $Param{Data}->{GetAttachmentContents} = 1;
    }

    my $ErrorMessage = '';

    my $ReturnData = {
        Success => 1,
    };


    # get needed objects
    my $FAQObject    = $Kernel::OM->Get('Kernel::System::FAQ');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get the config of FAQ fields that should be shown
    my %Fields;
    FIELD:
    for my $Number ( 1 .. 6 ) {

        # get config of FAQ field
        my $Config = $ConfigObject->Get( 'FAQ::Item::Field' . $Number );

        # skip over not shown fields
        next FIELD if !$Config->{Show};

        # store only the config of fields that should be shown
        $Fields{"Field$Number"} = $Config;
    }

    # check needed stuff
    # get parameters
    my %GetParam;
    my $ParamObject;
    for my $ParamName (
        qw(Title CategoryID StateID LanguageID ValidID Keywords Approved)
        )
    {
        $GetParam{$ParamName} = $Param{Data}->{$ParamName} || '';
    }


    for my $ParamName (keys %Fields)
    {
        if ($Param{Data}->{$Fields{$ParamName}{Caption}}) {
             $GetParam{$ParamName} = $Param{Data}->{$Fields{$ParamName}{Caption}} || '';
        }  
    }

    #my %GetParam;
    my $ContentType;
    my $LayoutObject;
        my $FAQID = $FAQObject->FAQAdd(
            %GetParam,
            ContentType => 'text/html',
            UserID      => 1,
        );

    # show error if FAQ could not be added

        if ( !$FAQID ) {
           return $Self->ReturnError(
                ErrorCode    => 'CreateFAQ.ServerError',
                ErrorMessage => "CreateFAQ: Unable To create FAQ",
            ) 
        }


    $ReturnData->{Data}->{Success} = 1;

    # return result
    return  $ReturnData;
}

1;


