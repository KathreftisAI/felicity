# --
# Author : Rohit Ambre


package Kernel::Modules::CreateFAQ;

use strict;
use warnings;

use MIME::Base64;
use Kernel::System::VariableCheck qw(IsArrayRefWithData IsHashRefWithData IsStringWithData);


our $ObjectManagerDisabled = 1;




sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}



sub Run {
    my ( $Self, %Param ) = @_;

    my $JSON = '';

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # get param object
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');


    my %Result;


   # check needed hashes
    for my $Needed (qw(Title CategoryID StateID LanguageID ValidID)) {
        if (  !$ParamObject->GetParam( Param => $Needed )  ) {

            %Result=(
                 ErrorCode    => 'CreateFAQ.MissingParameter',
                 ErrorMessage => "CreateFAQ: $Needed parameter is missing or not valid!",
             );
            # build JSON output
            $JSON = $LayoutObject->JSONEncode(
            Data => \%Result,
            );

            return $LayoutObject->Attachment(
                ContentType => 'text/plain; charset=' . $LayoutObject->{Charset},
                Content     => $JSON || '',
                Type        => 'inline',
                NoCache     => 1,
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
    for my $ParamName (
        qw(Title CategoryID StateID LanguageID ValidID Keywords Approved)
        )
    {
        $GetParam{$ParamName} = $ParamObject->GetParam( Param => $ParamName ) || '';
    }


    for my $ParamName (keys %Fields)
    {
        if ($ParamObject->GetParam( Param =>$Fields{$ParamName}{Caption})) {
             $GetParam{$ParamName} = $ParamObject->GetParam( Param => $Fields{$ParamName}{Caption}) || '';
        }  
    }

    #my %GetParam;
    my $ContentType;
        my $FAQID = $FAQObject->FAQAdd(
            %GetParam,
            ContentType => 'text/html',
            UserID      => 1,
        );

    # show error if FAQ could not be added

        if ( !$FAQID ) {
 
            %Result=(
                 ErrorCode    => 'CreateFAQ.ServerError',
                 ErrorMessage => "CreateFAQ: Unable To create FAQ",
             );
            # build JSON output
            $JSON = $LayoutObject->JSONEncode(
            Data => \%Result,
            );

            return $LayoutObject->Attachment(
                ContentType => 'text/plain; charset=' . $LayoutObject->{Charset},
                Content     => $JSON || '',
                Type        => 'inline',
                NoCache     => 1,
            );
        }

    $Result{Success}=1;
    $Result{FAQID}=$FAQID;
    # build JSON output
    $JSON = $LayoutObject->JSONEncode(
        Data => \%Result,
    );

    # send JSON response
    return $LayoutObject->Attachment(
        ContentType => 'text/plain; charset=' . $LayoutObject->{Charset},
        Content     => $JSON || '',
        Type        => 'inline',
        NoCache     => 1,
    );

}

1;
