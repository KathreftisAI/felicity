# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::ITSMTemplate::OverviewSmall;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Output::HTML::Layout',
    'Kernel::System::ITSMChange::Template',
    'Kernel::System::Log',
    'Kernel::System::User',
    'Kernel::System::Valid',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # get UserID param
    $Self->{UserID} = $Param{UserID} || die "Got no UserID!";

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get log object
    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    # check needed stuff
    for my $Needed (qw(PageShown StartHit)) {
        if ( !$Param{$Needed} ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # need TemplateIDs
    if ( !$Param{TemplateIDs} ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => 'Need the TemplateIDs!',
        );
        return;
    }

    # store the template IDs
    my @IDs = @{ $Param{TemplateIDs} };

    # check ShowColumns parameter
    my @ShowColumns;
    if ( $Param{ShowColumns} && ref $Param{ShowColumns} eq 'ARRAY' ) {
        @ShowColumns = @{ $Param{ShowColumns} };
    }

    my @Col = (qw(Name TemplateTypeID ValidID CreateTime ChangeTime));
    my %Order;
    my %CSS;

    for my $Key (@Col) {
        if ( $Param{SortBy} && ( $Param{SortBy} eq $Key ) ) {
            if ( $Param{OrderBy} && ( $Param{OrderBy} eq 'Up' ) ) {
                $Order{ 'OrderBy' . $Key } = 'Down';
                $CSS{ 'Sort' . $Key }      = ' SortDescending';
            }
            else {
                $Order{ 'OrderBy' . $Key } = 'Up';
                $CSS{ 'Sort' . $Key }      = ' SortAscending';
            }
        }
    }

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # build column header blocks
    if (@ShowColumns) {
        for my $Column (@ShowColumns) {

            $LayoutObject->Block(
                Name => 'Record' . $Column . 'Header',
                Data => {
                    %Param,
                    %Order,
                    %CSS,
                },
            );
        }
    }

    my $Output  = '';
    my $Counter = 0;

    # show templates if there are some
    if (@IDs) {

        ID:
        for my $ID (@IDs) {
            $Counter++;
            if (
                $Counter >= $Param{StartHit}
                && $Counter < ( $Param{PageShown} + $Param{StartHit} )
                )
            {

                # display the template data
                my $Template = $Kernel::OM->Get('Kernel::System::ITSMChange::Template')->TemplateGet(
                    TemplateID => $ID,
                    UserID     => $Self->{UserID},
                );
                my %Data = %{$Template};

                # human readable validity
                $Data{Valid} = $Kernel::OM->Get('Kernel::System::Valid')->ValidLookup( ValidID => $Data{ValidID} );

                # get user data for needed user types
                USERTYPE:
                for my $UserType (qw(CreateBy ChangeBy)) {

                    # check if UserType attribute exists in the template
                    next USERTYPE if !$Data{$UserType};

                    # get user data
                    my %User = $Kernel::OM->Get('Kernel::System::User')->GetUserData(
                        UserID => $Data{$UserType},
                        Cached => 1,
                    );

                    # set user data
                    $Data{ $UserType . 'UserLogin' }        = $User{UserLogin};
                    $Data{ $UserType . 'UserFirstname' }    = $User{UserFirstname};
                    $Data{ $UserType . 'UserLastname' }     = $User{UserLastname};
                    $Data{ $UserType . 'LeftParenthesis' }  = '(';
                    $Data{ $UserType . 'RightParenthesis' } = ')';
                }

                # build record block
                $LayoutObject->Block(
                    Name => 'Record',
                    Data => {
                        %Param,
                        %Data,
                    },
                );

                # build column record blocks
                if (@ShowColumns) {
                    for my $Column (@ShowColumns) {
                        if ( $Column eq 'EditContent' && $Data{Type} eq 'CAB' ) {
                            $LayoutObject->Block(
                                Name => 'RecordEditContentCAB',
                                Data => {
                                    %Param,
                                    %Data,
                                },
                            );
                        }
                        else {
                            $LayoutObject->Block(
                                Name => 'Record' . $Column,
                                Data => {
                                    %Param,
                                    %Data,
                                },
                            );
                        }
                    }
                }
            }
        }
    }

    # if there are no templates to show, a no data found message is displayed in the table
    else {
        $LayoutObject->Block(
            Name => 'NoDataFoundMsg',
            Data => {
                TotalColumns => scalar @ShowColumns,
            },
        );
    }

    # use template
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentITSMTemplateOverviewSmall',
        Data         => {
            %Param,
            Type        => $Self->{ViewType},
            ColumnCount => scalar @ShowColumns,
        },
    );

    return $Output;
}

1;
