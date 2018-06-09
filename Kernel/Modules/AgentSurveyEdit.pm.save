# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentSurveyEdit;

use strict;
use warnings;

use Kernel::Language qw(Translatable);

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # get common objects
    %{$Self} = %Param;

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get needed objects
    my $SurveyObject = $Kernel::OM->Get('Kernel::System::Survey');
    my $ParamObject  = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    my $SurveyID = $ParamObject->GetParam( Param => "SurveyID" );

    # ------------------------------------------------------------ #
    # survey edit
    # ------------------------------------------------------------ #
    if ( !$Self->{Subaction} ) {

        # check if survey exists
        my $SurveyExists = $SurveyObject->ElementExists(
            ElementID => $SurveyID,
            Element   => 'Survey'
        );
        if ( $SurveyExists ne 'Yes' ) {

            return $LayoutObject->NoPermission(
                Message    => Translatable('You have no permission for this survey!'),
                WithHeader => 'yes',
            );
        }

        my %Survey = $SurveyObject->SurveyGet( SurveyID => $SurveyID );

        return $Self->_SurveyEditMask(
            %Survey,
        );

    }

    # ------------------------------------------------------------ #
    # survey save
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'SurveySave' ) {

        if ( !$SurveyID ) {

            return $LayoutObject->ErrorScreen(
                Message => Translatable('No SurveyID is given!'),
                Comment => Translatable('Please contact the administrator.'),
            );
        }

        # get required form elements and errors
        my %ServerError;
        my %FormElements;
        for my $Item (
            qw( Title Introduction Description NotificationSender NotificationSubject NotificationBody )
            )
        {
            $FormElements{$Item} = $ParamObject->GetParam( Param => "$Item" );

            if ( !$FormElements{$Item} ) {
                $ServerError{ "$Item" . 'ServerError' } = 'ServerError';
            }
        }

        # get array params
        for my $Item (qw(Queues TicketTypeIDs ServiceIDs)) {
            @{ $FormElements{$Item} } = $ParamObject->GetArray( Param => $Item );
        }

        if ( $Kernel::OM->Get('Kernel::Config')->Get('Frontend::RichText') ) {
            $FormElements{Introduction} = ( length $FormElements{Introduction} )
                ? "\$html/text\$ $FormElements{Introduction}"
                : '';
            $FormElements{NotificationBody} = ( length $FormElements{NotificationBody} )
                ? "\$html/text\$ $FormElements{NotificationBody}"
                : '';
            $FormElements{Description} = ( length $FormElements{Description} )
                ? "\$html/text\$ $FormElements{Description}"
                : '';
        }

        # save if no errors
        if ( !%ServerError ) {
            my $SaveResult = $SurveyObject->SurveyUpdate(
                %FormElements,
                SurveyID => $SurveyID,
                UserID   => $Self->{UserID},
            );

            return $LayoutObject->PopupClose(
                URL => "Action=AgentSurveyZoom;SurveyID=$SurveyID;",
            );

        }

        # reload form if error
        return $Self->_SurveyEditMask(
            FormElements => \%FormElements,
            ServerError  => \%ServerError,
            SurveyID     => $SurveyID,
        );
    }
}

sub _SurveyEditMask {
    my ( $Self, %Param ) = @_;

    my %ServerError;
    if ( $Param{ServerError} ) {
        %ServerError = %{ $Param{ServerError} };
    }

    my %FormElements;
    if ( $Param{FormElements} ) {
        %FormElements = %{ $Param{FormElements} };
    }

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    my $Output = $LayoutObject->Header(
        Title     => Translatable('Survey Edit'),
        Type      => 'Small',
        BodyClass => 'Popup',
    );

    my %Queues      = $Kernel::OM->Get('Kernel::System::Queue')->GetAllQueues();
    my $QueueString = $LayoutObject->BuildSelection(
        Data         => \%Queues,
        Name         => 'Queues',
        Size         => 6,
        Multiple     => 1,
        PossibleNone => 0,
        Sort         => 'AlphanumericValue',
        Translation  => 0,
        SelectedID   => $FormElements{Queues} || $Param{Queues},
        Class        => 'Modernize',
    );

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # check if the for send condition ticket type check is enabled
    if ( $ConfigObject->Get('Survey::CheckSendConditionTicketType') ) {

        # get the valid ticket type list
        my %TicketTypes = $Kernel::OM->Get('Kernel::System::Type')->TypeList();

        # check if a ticket type is available
        if (%TicketTypes) {

            # build ticket type selection
            my $TicketTypeStrg = $LayoutObject->BuildSelection(
                Data         => \%TicketTypes,
                Name         => 'TicketTypeIDs',
                Size         => 6,
                Multiple     => 1,
                PossibleNone => 0,
                Sort         => 'AlphanumericValue',
                Translation  => 0,
                SelectedID   => $FormElements{TicketTypeIDs} || $Param{TicketTypeIDs},
                Class        => 'Modernize',
            );

            $LayoutObject->Block(
                Name => 'TicketTypes',
                Data => {
                    TicketTypeStrg => $TicketTypeStrg,
                },
            );
        }
    }

    # check if the send condition service check is enabled
    if ( $ConfigObject->Get('Survey::CheckSendConditionService') ) {

        # get the valid service list
        my %Services = $Kernel::OM->Get('Kernel::System::Service')->ServiceList(
            UserID => 1,
        );

        # check if a service is available
        if (%Services) {

            # build service selection
            my $ServiceStrg = $LayoutObject->BuildSelection(
                Data         => \%Services,
                Name         => 'ServiceIDs',
                Size         => 6,
                Multiple     => 1,
                PossibleNone => 0,
                Sort         => 'AlphanumericValue',
                Translation  => 0,
                SelectedID   => $FormElements{ServiceIDs} || $Param{ServiceIDs},
                Class        => 'Modernize',
            );

            $LayoutObject->Block(
                Name => 'TicketServices',
                Data => {
                    ServiceStrg => $ServiceStrg,
                },
            );
        }
    }

    # rich text elements
    my %SurveyElements;

    $SurveyElements{Introduction} = $FormElements{Introduction} || $Param{Introduction};

    $SurveyElements{NotificationBody}
        = $FormElements{NotificationBody} || $Param{NotificationBody} || $ConfigObject->Get('Survey::NotificationBody');

    $SurveyElements{Description} = $FormElements{Description} || $Param{Description} || '';

    # load rich text editor
    my $RichTextEditor = $ConfigObject->Get('Frontend::RichText');
    if ($RichTextEditor) {
        $LayoutObject->Block( Name => 'RichText' );
    }

    # convert required elements to RTE
    FIELD:
    for my $SurveyField ( sort keys %SurveyElements ) {
        next FIELD if !$SurveyElements{$SurveyField};

        # clean HTML
        my $HTMLContent =
            $SurveyElements{$SurveyField} =~ s{\A\$html\/text\$\s(.*)}{$1}xms;

        if ( !$HTMLContent && $RichTextEditor ) {
            $SurveyElements{$SurveyField} = $LayoutObject->Ascii2Html(
                Text           => $SurveyElements{$SurveyField},
                HTMLResultMode => 1,
            );
        }
        elsif ( $HTMLContent && !$RichTextEditor ) {
            $SurveyElements{$SurveyField} = $Kernel::OM->Get('Kernel::System::HTMLUtils')->ToAscii(
                String => $SurveyElements{$SurveyField},
            );
        }
    }

    $LayoutObject->Block(
        Name => 'Introduction',
        Data => {
            Introduction => $SurveyElements{Introduction},
        },
    );

    $LayoutObject->Block(
        Name => 'NotificationBody',
        Data => {
            NotificationBody => $SurveyElements{NotificationBody},
        },
    );

    $LayoutObject->Block(
        Name => 'InternalDescription',
        Data => {
            Description => $SurveyElements{Description},
        },
    );

    # generates generic errors for JavaScript
    for my $NeededItem (
        qw( Title Introduction Description NotificationSender NotificationSubject NotificationBody )
        )
    {
        $LayoutObject->Block(
            Name => 'GenericError',
            Data => {
                ItemName => $NeededItem . 'Error',
            },
        );
    }

    for my $Item ( sort keys %ServerError ) {
        $LayoutObject->Block(
            Name => 'GenericServerError',
            Data => {
                ItemName => $Item,
            },
        );
    }

    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentSurveyEdit',
        Data         => {
            %Param,
            QueueString        => $QueueString,
            NotificationSender => $FormElements{NotificationSender}
                || $Param{NotificationSender}
                || $ConfigObject->Get('Survey::NotificationSender'),
            NotificationSubject => $FormElements{NotificationSubject}
                || $Param{NotificationSubject}
                || $ConfigObject->Get('Survey::NotificationSubject'),
            %ServerError,
            %FormElements,
        },
    );
    $Output .= $LayoutObject->Footer(
        Type => 'Small',
    );

    return $Output;
}
1;
