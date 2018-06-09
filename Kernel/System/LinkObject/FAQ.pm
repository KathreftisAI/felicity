# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::LinkObject::FAQ;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::FAQ',
    'Kernel::System::Group',
    'Kernel::System::Log',
);

=head1 NAME

Kernel::System::LinkObject::FAQ

=head1 SYNOPSIS

FAQ backend for the link object.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object. Do not use it directly, instead use:

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $FAQObjectBackend = $Kernel::OM->Get('Kernel::System::LinkObject::FAQ');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # create additional objects
    # $GroupObject = Kernel::System::Group->new( %{$Self} );
    # $FAQObject   = Kernel::System::FAQ->new( %{$Self} );

    return $Self;
}

=item LinkListWithData()

fill up the link list with data

    $Success = $FAQLinkObject->LinkListWithData(
        LinkList => $HashRef,
        UserID   => 1,
    );

=cut

sub LinkListWithData {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(LinkList UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    # check link list
    if ( ref $Param{LinkList} ne 'HASH' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'LinkList must be a hash reference!',
        );

        return;
    }

    # get FAQ object
    my $FAQObject = $Kernel::OM->Get('Kernel::System::FAQ');

    for my $LinkType ( sort keys %{ $Param{LinkList} } ) {

        for my $Direction ( sort keys %{ $Param{LinkList}->{$LinkType} } ) {

            FAQID:
            for my $FAQID ( sort keys %{ $Param{LinkList}->{$LinkType}->{$Direction} } ) {

                # get FAQ data
                my %FAQData = $FAQObject->FAQGet(
                    ItemID     => $FAQID,
                    ItemFields => 1,
                    UserID     => $Param{UserID},
                );

                # remove id from hash if no FAQ data was found
                if ( !%FAQData ) {
                    delete $Param{LinkList}->{$LinkType}->{$Direction}->{$FAQID};
                    next FAQID;
                }

                # add FAQ data
                $Param{LinkList}->{$LinkType}->{$Direction}->{$FAQID} = \%FAQData;
            }
        }
    }

    return 1;
}

=item ObjectPermission()

checks read permission for a given object and UserID.

    $Permission = $FAQLinkObject->ObjectPermission(
        Object  => 'FAQ',
        Key     => 123,
        UserID  => 1,
    );

=cut

sub ObjectPermission {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Object Key UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    # check module registry of AgentFAQZoom
    my $ModuleReg = $Kernel::OM->Get('Kernel::Config')->Get('Frontend::Module')->{AgentFAQZoom};

    # do not grant access if frontend module is not registered
    return if !$ModuleReg;

    # grant access if module permission has no Group or GroupRo defined
    if ( !$ModuleReg->{GroupRo} && !$ModuleReg->{Group} ) {

        return 1;
    }

    # get database object
    my $GroupObject = $Kernel::OM->Get('Kernel::System::Group');

    PERMISSION:
    for my $Permission (qw(GroupRo Group)) {

        next PERMISSION if !$ModuleReg->{$Permission};
        next PERMISSION if ref $ModuleReg->{$Permission} ne 'ARRAY';

        for my $Group ( @{ $ModuleReg->{$Permission} } ) {

            # get the group id
            my $GroupID = $GroupObject->GroupLookup( Group => $Group );

            my $Type;
            if ( $Permission eq 'GroupRo' ) {
                $Type = 'ro';
            }
            elsif ( $Permission eq 'Group' ) {
                $Type = 'rw';
            }

            # get user groups, where the user has the appropriate privilege
            my %Groups = $GroupObject->GroupMemberList(
                UserID => $Param{UserID},
                Type   => $Type,
                Result => 'HASH',
            );

            # grant access if agent is a member in the group
            return 1 if $Groups{$GroupID};
        }
    }

    return;
}

=item ObjectDescriptionGet()

return a hash of object descriptions

Return
    %Description = (
        Normal => "FAQ# 1234",
        Long   => "FAQ# 1234: FAQTitle",
    );

    %Description = $LinkObject->ObjectDescriptionGet(
        Key     => 123,
        UserID  => 1,
    );

=cut

sub ObjectDescriptionGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Object Key UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    # create description
    my %Description = (
        Normal => 'FAQ',
        Long   => 'FAQ',
    );

    return %Description if $Param{Mode} && $Param{Mode} eq 'Temporary';

    # get FAQ
    my %FAQ = $Kernel::OM->Get('Kernel::System::FAQ')->FAQGet(
        ItemID     => $Param{Key},
        ItemFields => 1,
        UserID     => $Param{UserID},
    );

    return if !%FAQ;

    # define description text
    my $FAQHook         = $Kernel::OM->Get('Kernel::Config')->Get('FAQ::FAQHook');
    my $DescriptionText = "$FAQHook $FAQ{Number}";

    # create description
    %Description = (
        Normal => $DescriptionText,
        Long   => "$DescriptionText: $FAQ{Title}",
    );

    return %Description;
}

=item ObjectSearch()

return a hash list of the search results

Return
    $SearchList = {
        NOTLINKED => {
            Source => {
                12  => $DataOfItem12,
                212 => $DataOfItem212,
                332 => $DataOfItem332,
            },
        },
    };

    $SearchList = $LinkObjectBackend->ObjectSearch(
        SearchParams => $HashRef,  # (optional)
        UserID       => 1,
    );

=cut

sub ObjectSearch {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need UserID!',
        );

        return;
    }

    # set default params
    $Param{SearchParams} ||= {};

    # add wild-cards
    my %Search;
    if ( $Param{SearchParams}->{Title} ) {
        $Search{Title} = '*' . $Param{SearchParams}->{Title} . '*';
    }
    if ( $Param{SearchParams}->{Number} ) {
        $Search{Number} = '*' . $Param{SearchParams}->{Number} . '*';
    }
    if ( $Param{SearchParams}->{What} ) {
        $Search{What} = '*' . $Param{SearchParams}->{What} . '*';
    }

    # get FAQ object
    my $FAQObject = $Kernel::OM->Get('Kernel::System::FAQ');

    # search the FAQs
    my @FAQIDs = $FAQObject->FAQSearch(
        %{ $Param{SearchParams} },
        %Search,
        Order  => 'Created',
        Sort   => 'down',
        Limit  => 50,
        UserID => $Param{UserID},
    );

    my %SearchList;
    FAQID:
    for my $FAQID (@FAQIDs) {

        # get FAQ data
        my %FAQData = $FAQObject->FAQGet(
            ItemID     => $FAQID,
            ItemFields => 1,
            UserID     => $Param{UserID},
        );

        next FAQID if !%FAQData;

        # add FAQ data
        $SearchList{NOTLINKED}->{Source}->{$FAQID} = \%FAQData;
    }

    return \%SearchList;
}

=item LinkAddPre()

link add pre event module

    $True = $FAQLinkObject->LinkAddPre(
        Key          => 123,
        SourceObject => 'FAQ',
        SourceKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

    or

    $True = $FAQLinkObject->LinkAddPre(
        Key          => 123,
        TargetObject => 'FAQ',
        TargetKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

=cut

sub LinkAddPre {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Type State UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    return 1 if $Param{State} eq 'Temporary';

    return 1;
}

=item LinkAddPost()

link add pre event module

    $True = $FAQLinkObject->LinkAddPost(
        Key          => 123,
        SourceObject => 'FAQ',
        SourceKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

    or

    $True = $FAQLinkObject->LinkAddPost(
        Key          => 123,
        TargetObject => 'FAQ',
        TargetKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

=cut

sub LinkAddPost {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Type State UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    return 1 if $Param{State} eq 'Temporary';

    return 1;
}

=item LinkDeletePre()

link delete pre event module

    $True = $FAQLinkObject->LinkDeletePre(
        Key          => 123,
        SourceObject => 'FAQ',
        SourceKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

    or

    $True = $FAQLinkObject->LinkDeletePre(
        Key          => 123,
        TargetObject => 'FAQ',
        TargetKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

=cut

sub LinkDeletePre {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Type State UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    return 1 if $Param{State} eq 'Temporary';

    return 1;
}

=item LinkDeletePost()

link delete post event module

    $True = $FAQLinkObject->LinkDeletePost(
        Key          => 123,
        SourceObject => 'FAQ',
        SourceKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

    or

    $True = $FAQLinkObject->LinkDeletePost(
        Key          => 123,
        TargetObject => 'FAQ',
        TargetKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

=cut

sub LinkDeletePost {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Type State UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    return 1 if $Param{State} eq 'Temporary';

    return 1;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
