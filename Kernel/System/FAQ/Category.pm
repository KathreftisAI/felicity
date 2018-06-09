# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::FAQ::Category;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::Cache',
    'Kernel::System::CustomerGroup',
    'Kernel::System::DB',
    'Kernel::System::Group',
    'Kernel::System::Log',
    'Kernel::System::Valid'
);

=head1 NAME

Kernel::System::FAQ::Category - sub module of Kernel::System::FAQ

=head1 SYNOPSIS

All FAQ category functions.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item CategoryAdd()

add a category

    my $CategoryID = $FAQObject->CategoryAdd(
        Name     => 'CategoryA',
        Comment  => 'Some comment',
        ParentID => 2,
        ValidID  => 1,
        UserID   => 1,
    );

Returns:

    $CategoryID = 34;               # or undef if category could not be added

=cut

sub CategoryAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Name UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    # check needed stuff
    if ( !defined $Param{ParentID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need ParentID!",
        );

        return;
    }

    # check that ParentID is not an empty string but number 0 is allowed
    if ( $Param{ParentID} eq '' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "ParentID cannot be empty!",
        );

        return;
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # insert record
    return if !$DBObject->Do(
        SQL => '
            INSERT INTO faq_category (name, parent_id, comments, valid_id, created, created_by,
                changed, changed_by)
            VALUES ( ?, ?, ?, ?, current_timestamp, ?, current_timestamp, ?)',
        Bind => [
            \$Param{Name}, \$Param{ParentID}, \$Param{Comment}, \$Param{ValidID},
            \$Param{UserID}, \$Param{UserID},
        ],
    );

    # get new category id
    return if !$DBObject->Prepare(
        SQL => '
            SELECT id
            FROM faq_category
            WHERE name = ?',
        Bind  => [ \$Param{Name} ],
        Limit => 1,
    );

    my $CategoryID;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $CategoryID = $Row[0];
    }

    # log notice
    $Kernel::OM->Get('Kernel::System::Log')->Log(
        Priority => 'notice',
        Message  => "FAQCategory: '$Param{Name}' CategoryID: '$CategoryID' "
            . "created successfully ($Param{UserID})!",
    );

    return $CategoryID;
}

=item CategoryCount()

Count the number of categories.

    my $CategoryCount = $FAQObject->CategoryCount(
        ParentIDs => [ 1, 2, 3, 4 ],
        UserID    => 1,
    );

Returns:

    $CategoryCount = 6;

=cut

sub CategoryCount {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need UserID!',
        );

        return;
    }

    # check needed stuff
    if ( !defined $Param{ParentIDs} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need ParentIDs!',
        );

        return;
    }

    # build SQL
    my $SQL = '
        SELECT COUNT(*)
        FROM faq_category
        WHERE valid_id IN ('
        . join ', ', $Kernel::OM->Get('Kernel::System::Valid')->ValidIDsGet()
        . ')';

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # parent ids are given
    if ( defined $Param{ParentIDs} ) {

        # integer quote the parent ids
        for my $ParentID ( @{ $Param{ParentIDs} } ) {
            $ParentID = $DBObject->Quote( $ParentID, 'Integer' );
        }

        # create string
        my $InString = join ', ', @{ $Param{ParentIDs} };

        $SQL .= ' AND parent_id IN (' . $InString . ')';
    }

    # add group by
    $SQL .= ' GROUP BY parent_id';

    return if !$DBObject->Prepare(
        SQL   => $SQL,
        Limit => 200,
    );

    my $Count = 0;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $Count = $Row[0];
    }

    return $Count;
}

=item CategoryDelete()

Delete a category.

    my $DeleteSuccess = $FAQObject->CategoryDelete(
        CategoryID => 123,
        UserID      => 1,
    );

Returns:

    DeleteSuccess = 1;              # or undef if category could not be deleted

=cut

sub CategoryDelete {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Attribute (qw(CategoryID UserID)) {
        if ( !$Param{$Attribute} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Attribute!",
            );

            return;
        }
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # delete the category
    return if !$DBObject->Do(
        SQL => '
            DELETE FROM faq_category
            WHERE id = ?',
        Bind => [ \$Param{CategoryID} ],
    );

    # delete the category groups
    return if !$DBObject->Do(
        SQL => '
            DELETE FROM faq_category_group
            WHERE category_id = ?',
        Bind => [ \$Param{CategoryID} ],
    );

    return 1;
}

=item CategoryDuplicateCheck()

check a category for duplicate name under the same parent

    my $Exists = $FAQObject->CategoryDuplicateCheck(
        CategoryID => 1,
        Name       => 'Some Name',
        ParentID   => 1,
        UserID     => 1,
    );

Returns:

    $Exists = 1;                # if category name already exists with the same parent
                                # or 0 if the name does not exists with the same parent

=cut

sub CategoryDuplicateCheck {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need UserID!",
        );

        return;
    }

    # set defaults
    $Param{Name} //= '';
    $Param{ParentID} ||= 0;
    my @Values;
    push @Values, \$Param{Name};
    push @Values, \$Param{ParentID};

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # db quote
    $Param{ParentID} = $DBObject->Quote( $Param{ParentID}, 'Integer' );

    # build SQL
    my $SQL = '
        SELECT id
        FROM faq_category
        WHERE name = ?
            AND parent_id = ?
        ';
    if ( defined $Param{CategoryID} ) {
        $SQL .= " AND id != ?";
        push @Values, \$Param{CategoryID};

    }

    # prepare SQL statement
    return if !$DBObject->Prepare(
        SQL   => $SQL,
        Bind  => \@Values,
        Limit => 1,
    );

    # fetch the result
    my $Exists;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $Exists = 1;
    }

    return $Exists;
}

=item CategoryGet()

get a category as hash

    my %Category = $FAQObject->CategoryGet(
        CategoryID => 1,
        UserID     => 1,
    );

Returns:

    %Category = (,
        CategoryID => 2,
        ParentID   => 0,
        Name       => 'My Category',
        Comment    => 'This is my first category.',
        ValidID    => 1,
    );

=cut

sub CategoryGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need UserID!",
        );

        return;
    }

    # check needed stuff
    if ( !defined $Param{CategoryID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need CategoryID!',
        );

        return;
    }

    # check cache
    my $CacheKey = 'CategoryGet::' . $Param{CategoryID};

    # get cache object
    my $CacheObject = $Kernel::OM->Get('Kernel::System::Cache');

    my $Cache = $CacheObject->Get(
        Type => 'FAQ',
        Key  => $CacheKey,
    );

    return %{$Cache} if $Cache;

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # SQL
    return if !$DBObject->Prepare(
        SQL => '
            SELECT id, parent_id, name, comments, valid_id
            FROM faq_category
            WHERE id = ?',
        Bind  => [ \$Param{CategoryID} ],
        Limit => 1,
    );

    my %Data;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        %Data = (
            CategoryID => $Row[0],
            ParentID   => $Row[1],
            Name       => $Row[2],
            Comment    => $Row[3],
            ValidID    => $Row[4],
        );
    }

    # cache result
    $CacheObject->Set(
        Type  => 'FAQ',
        Key   => $CacheKey,
        Value => \%Data,
        TTL   => 60 * 60 * 24 * 2,
    );

    return %Data;
}

=item CategoryGroupGet()

get groups of a category

    my $GroupArrayRef = $FAQObject->CategoryGroupGet(
        CategoryID => 3,
        UserID     => 1,
    );

Returns:

    $GroupArrayRef = [
        2,
        9,
        10,
    ];

=cut

sub CategoryGroupGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(CategoryID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # get groups
    return if !$DBObject->Prepare(
        SQL => '
            SELECT group_id
            FROM faq_category_group
            WHERE category_id = ?',
        Bind => [ \$Param{CategoryID} ],
    );

    my @Groups;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        push @Groups, $Row[0];
    }

    return \@Groups;
}

=item CategoryGroupGetAll()

get all category-groups

    my $AllCategoryGroupHashRef = $FAQObject->CategoryGroupGetAll(
        UserID => 1,
    );

Returns:

    $AllCategoryGroupHashRef = {
        1 => {
            2  => 1,
        },
        2 => {
            2  => 1,
            9  => 1,
            10 => 1,
        },
        3 => {
            2  => 1,
            9  => 1,
            10 => 1,
        },
        4 => {
            1  => 1,
            2  => 1,
            3  => 1,
            4  => 1,
            5  => 1,
            9  => 1,
            10 => 1,
        },
    };

=cut

sub CategoryGroupGetAll {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need UserID!",
        );

        return;
    }

    # check cache
    if ( $Self->{Cache}->{CategoryGroupGetAll} ) {

        return $Self->{Cache}->{CategoryGroupGetAll};
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # get groups
    return if !$DBObject->Prepare(
        SQL => '
            SELECT group_id, category_id
            FROM faq_category_group',
    );

    my %Groups;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $Groups{ $Row[1] }->{ $Row[0] } = 1;
    }

    # cache
    $Self->{Cache}->{CategoryGroupGetAll} = \%Groups;

    return \%Groups;
}

=item CategoryList()

get the category list as hash

    my $CategoryHashRef = $FAQObject->CategoryList(
        Valid  => 1,   # (optional)
        UserID => 1,
    );

Returns:

    $CategoryHashRef = {
        0 => {
            1 => 'Misc',
            2 => 'My Category',
        },
        2 => {
            3 => 'Sub Category A',
            4 => 'Sub Category B',
        },
    };

=cut

sub CategoryList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need UserID!",
        );

        return;
    }

    # set default
    my $Valid = 0;
    if ( defined $Param{Valid} ) {
        $Valid = $Param{Valid};
    }

    # check cache
    if ( $Self->{Cache}->{CategoryList}->{$Valid} ) {

        return $Self->{Cache}->{CategoryList}->{$Valid};
    }

    # build SQL
    my $SQL = '
        SELECT id, parent_id, name
        FROM faq_category';
    if ($Valid) {

        # get the valid ids
        $SQL .= ' WHERE valid_id IN ('
            . join ', ', $Kernel::OM->Get('Kernel::System::Valid')->ValidIDsGet()
            . ')';
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # prepare SQL statement
    return if !$DBObject->Prepare( SQL => $SQL );

    # fetch the result
    my %Data;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $Data{ $Row[1] }->{ $Row[0] } = $Row[2];
    }

    # cache
    $Self->{Cache}->{CategoryList}->{$Valid} = \%Data;

    return \%Data;
}

=item CategorySearch()

get the category search as an array ref

    my $CategoryIDArrayRef = $FAQObject->CategorySearch(
        Name        => 'Test',
        ParentID    => 3,
        ParentIDs   => [ 1, 3, 8 ],
        CategoryIDs => [ 2, 5, 7 ],
        OrderBy     => 'Name',
        SortBy      => 'down',
        UserID      => 1,
    );

Returns:

    $CategoryIDArrayRef = [
        2,
    ];

=cut

sub CategorySearch {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need UserID!",
        );

        return;
    }

    # SQL
    my $SQL = '
        SELECT id
        FROM faq_category
        WHERE valid_id IN ('
        . join ', ', $Kernel::OM->Get('Kernel::System::Valid')->ValidIDsGet()
        . ')';

    my $Ext = '';

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # search for name
    if ( defined $Param{Name} ) {

        # db like quote
        $Param{Name} = $DBObject->Quote( $Param{Name}, 'Like' );

        $Ext .= " AND name LIKE '%" . $Param{Name} . "%' $Self->{LikeEscapeString}";
    }

    # search for parent id
    elsif ( defined $Param{ParentID} ) {

        # db integer quote
        $Param{ParentID} = $DBObject->Quote( $Param{ParentID}, 'Integer' );

        $Ext .= ' AND parent_id = ' . $Param{ParentID};
    }

    # search for parent ids
    elsif (
        defined $Param{ParentIDs}
        && ref $Param{ParentIDs} eq 'ARRAY'
        && @{ $Param{ParentIDs} }
        )
    {

        # integer quote the parent ids
        for my $ParentID ( @{ $Param{ParentIDs} } ) {
            $ParentID = $DBObject->Quote( $ParentID, 'Integer' );
        }

        # create string
        my $InString = join ', ', @{ $Param{ParentIDs} };

        $Ext = ' AND parent_id IN (' . $InString . ')';
    }

    # search for category ids
    elsif (
        defined $Param{CategoryIDs}
        && ref $Param{CategoryIDs} eq 'ARRAY'
        && @{ $Param{CategoryIDs} }
        )
    {

        # integer quote the category ids
        for my $CategoryID ( @{ $Param{CategoryIDs} } ) {
            $CategoryID = $DBObject->Quote( $CategoryID, 'Integer' );
        }

        # create string
        my $InString = join ', ', @{ $Param{CategoryIDs} };

        $Ext = ' AND id IN (' . $InString . ')';
    }

    # ORDER BY
    if ( $Param{OrderBy} ) {
        $Ext .= " ORDER BY name";

        # set the default sort order
        $Param{SortBy} ||= 'up';

        # SORT
        if ( $Param{SortBy} ) {
            if ( $Param{SortBy} eq 'up' ) {
                $Ext .= " ASC";
            }
            elsif ( $Param{SortBy} eq 'down' ) {
                $Ext .= " DESC";
            }
        }
    }

    # SQL STATEMENT
    $SQL .= $Ext;

    return if !$DBObject->Prepare(
        SQL   => $SQL,
        Limit => 500,
    );

    my @List;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        push @List, $Row[0];
    }

    return \@List;
}

=item CategorySubCategoryIDList()

get all subcategory ids of a category

    my $SubCategoryIDArrayRef = $FAQObject->CategorySubCategoryIDList(
        ParentID     => 1,
        Mode         => 'Public', # (Agent, Customer, Public)
        CustomerUser => 'tt',
        UserID       => 1,
    );

Returns:

    $SubCategoryIDArrayRef = [
        3,
        4,
        5,
        6,
    ];

=cut

sub CategorySubCategoryIDList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need UserID!",
        );

        return;
    }

    # check needed stuff
    if ( !defined $Param{ParentID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need ParentID!',
        );

        return;
    }

    my $Categories = {};

    if ( $Param{Mode} && $Param{Mode} eq 'Agent' ) {

        # get agents categories
        $Categories = $Self->GetUserCategories(
            Type   => 'ro',
            UserID => $Param{UserID},
        );
    }
    elsif ( $Param{Mode} && $Param{Mode} eq 'Customer' ) {

        # get customer categories
        $Categories = $Self->GetCustomerCategories(
            Type         => 'ro',
            CustomerUser => $Param{CustomerUser},
            UserID       => $Param{UserID},
        );
    }
    else {

        # get all categories
        $Categories = $Self->CategoryList(
            Valid  => 1,
            UserID => $Param{UserID},
        );
    }

    my @SubCategoryIDs;
    my @TempSubCategoryIDs = keys %{ $Categories->{ $Param{ParentID} } };
    SUBCATEGORYID:
    while (@TempSubCategoryIDs) {

        # get next subcategory id
        my $SubCategoryID = shift @TempSubCategoryIDs;

        # add to result
        push @SubCategoryIDs, $SubCategoryID;

        # check if subcategory has own subcategories
        next SUBCATEGORYID if !$Categories->{$SubCategoryID};

        # add new subcategories
        push @TempSubCategoryIDs, keys %{ $Categories->{$SubCategoryID} };
    }

    # sort subcategories numerically
    @SubCategoryIDs = sort { $a <=> $b } @SubCategoryIDs;

    return \@SubCategoryIDs;
}

=item CategoryTreeList()

get all categories as tree (with their long names)

    my $CategoryTree = $FAQObject->CategoryTreeList(
        Valid  => 0,  # (0|1, optional)
        UserID => 1,
    );

Returns:

    $CategoryTree = {
        1 => 'Misc',
        2 => 'My Category',
        3 => 'My Category::Sub Category A',
        4 => 'My Category::Sub Category B',
    };

=cut

sub CategoryTreeList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need UserID!",
        );

        return;
    }

    # set default
    my $Valid = 0;
    if ( $Param{Valid} ) {
        $Valid = $Param{Valid};
    }

    # check cache
    if ( $Self->{Cache}->{GetCategoryTree}->{$Valid} ) {

        return $Self->{Cache}->{GetCategoryTree}->{$Valid};
    }

    # build SQL
    my $SQL = '
        SELECT id, parent_id, name
        FROM faq_category';

    # add where clause for valid categories
    if ($Valid) {
        $SQL .= ' WHERE valid_id IN ('
            . join ', ', $Kernel::OM->Get('Kernel::System::Valid')->ValidIDsGet()
            . ')';
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # prepare SQL
    return if !$DBObject->Prepare(
        SQL => $SQL,
    );

    # fetch result
    my %CategoryMap;
    my %CategoryNameLookup;
    my %ParentIDLookup;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $CategoryMap{ $Row[1] }->{ $Row[0] } = $Row[2];
        $CategoryNameLookup{ $Row[0] }       = $Row[2];
        $ParentIDLookup{ $Row[0] }           = $Row[1];
    }

    # to store the category tree
    my %CategoryTree;

    # check all parent IDs
    for my $ParentID ( sort { $a <=> $b } keys %CategoryMap ) {

        # get subcategories and names for this parent id
        while ( my ( $CategoryID, $CategoryName ) = each %{ $CategoryMap{$ParentID} } ) {

            # lookup the parents name
            my $NewParentID = $ParentID;
            while ($NewParentID) {

                # pre-append parents category name
                if ( $CategoryNameLookup{$NewParentID} ) {
                    $CategoryName = $CategoryNameLookup{$NewParentID} . '::' . $CategoryName;
                }

                # get up one parent level
                $NewParentID = $ParentIDLookup{$NewParentID} || 0;
            }

            # add category to tree
            $CategoryTree{$CategoryID} = $CategoryName;
        }
    }

    # cache
    $Self->{Cache}->{GetCategoryTree}->{$Valid} = \%CategoryTree;

    return \%CategoryTree;
}

=item CategoryUpdate()

update a category

    my $Success = $FAQObject->CategoryUpdate(
        CategoryID => 2,
        ParentID   => 1,
        Name       => 'Some Category',
        Comment    => 'some comment',
        UserID     => 1,
    );

Returns:

    $Success = 1;                # or undef if category could not be updated

=cut

sub CategoryUpdate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Name UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    # check needed stuff
    for my $Argument (qw(CategoryID ParentID)) {
        if ( !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    # check that ParentID is not an empty string but number 0 is allowed
    if ( $Param{ParentID} eq '' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "ParentID cannot be empty!",
        );

        return;
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # SQL
    return if !$DBObject->Do(
        SQL => '
            UPDATE faq_category
            SET parent_id = ?, name = ?, comments = ?, valid_id = ?, changed = current_timestamp,
                changed_by = ?
            WHERE id = ?',
        Bind => [
            \$Param{ParentID}, \$Param{Name},
            \$Param{Comment},  \$Param{ValidID},
            \$Param{UserID},   \$Param{CategoryID},
        ],
    );

    # log notice
    $Kernel::OM->Get('Kernel::System::Log')->Log(
        Priority => 'notice',
        Message  => "FAQCategory: '$Param{Name}' "
            . "ID: '$Param{CategoryID}' updated successfully ($Param{UserID})!",
    );

    # delete all cache, as FAQGet() will be also affected.
    $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
        Type => 'FAQ',
    );

    return 1;
}

=item AgentCategorySearch()

get the category search as array ref

    my $CategoryIDArrayRef = $FAQObject->AgentCategorySearch(
        ParentID => 3,   # (optional, default 0)
        UserID   => 1,
    );

Returns:

    $CategoryIDArrayRef = [
        '4',
        '8',
    ];

=cut

sub AgentCategorySearch {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need UserID!',
        );

        return;
    }

    # set default parent id
    if ( !defined $Param{ParentID} ) {
        $Param{ParentID} = 0;
    }
    my $Categories = $Self->GetUserCategories(
        Type   => 'ro',
        UserID => $Param{UserID},
    );

    my %Category = %{ $Categories->{ $Param{ParentID} } };
    my @CategoryIDs = sort { $Category{$a} cmp $Category{$b} } ( keys %Category );

    return \@CategoryIDs;
}

=item CustomerCategorySearch()

get the category search as hash

    my $CategoryIDArrayRef = @{$FAQObject->CustomerCategorySearch(
        CustomerUser  => 'tt',
        ParentID      => 3,   # (optional, default 0)
        Mode          => 'Customer',
        UserID        => 1,
    )};

Returns:

    $CategoryIDArrayRef = [
        '4',
        '8',
    ];

=cut

sub CustomerCategorySearch {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(CustomerUser Mode UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    # set default parent id
    if ( !defined $Param{ParentID} ) {
        $Param{ParentID} = 0;
    }

    my $Categories = $Self->GetCustomerCategories(
        CustomerUser => $Param{CustomerUser},
        Type         => 'ro',
        UserID       => $Param{UserID},
    );

    my %Category = %{ $Categories->{ $Param{ParentID} } };
    my @CategoryIDs = sort { $Category{$a} cmp $Category{$b} } ( keys %Category );

    my @AllowedCategoryIDs;
    my %Articles;

    # check cache
    my $CacheKey = 'CustomerCategorySearch::Articles';
    if ( $Self->{Cache}->{$CacheKey} ) {
        %Articles = %{ $Self->{Cache}->{$CacheKey} };
    }
    else {

        # build valid id string
        my $ValidIDsString = join ', ', $Kernel::OM->Get('Kernel::System::Valid')->ValidIDsGet();

        my $SQL = "
            SELECT faq_item.id, faq_item.category_id
            FROM faq_item, faq_state_type, faq_state
            WHERE faq_state.id = faq_item.state_id
                AND faq_state.type_id = faq_state_type.id
                AND faq_state_type.name != 'internal'
                AND faq_item.valid_id IN ($ValidIDsString)
                AND faq_item.approved = 1";

        # get database object
        my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

        return if !$DBObject->Prepare(
            SQL => $SQL,
        );
        while ( my @Row = $DBObject->FetchrowArray() ) {
            $Articles{ $Row[1] }++;
        }

        # cache
        $Self->{Cache}->{$CacheKey} = \%Articles;
    }

    for my $CategoryID (@CategoryIDs) {

        # get all subcategory ids for this category
        my $SubCategoryIDs = $Self->CategorySubCategoryIDList(
            ParentID     => $CategoryID,
            Mode         => $Param{Mode},
            CustomerUser => $Param{CustomerUser},
            UserID       => $Param{UserID},
        );

        # add this category id
        my @IDs = ( $CategoryID, @{$SubCategoryIDs} );

        # check if category contains articles with state external or public
        ID:
        for my $ID (@IDs) {
            next ID if !$Articles{$ID};
            push @AllowedCategoryIDs, $CategoryID;
            last ID;
        }
    }

    return \@AllowedCategoryIDs;
}

=item PublicCategorySearch()

get the category search as hash

    my $CategoryIDArrayRef = $FAQObject->PublicCategorySearch(
        ParentID      => 3,   # (optional, default 0)
        Mode          => 'Public',
        UserID        => 1,
    );

Returns:

    $CategoryIDArrayRef = [
        '4',
        '8',
    ];

=cut

sub PublicCategorySearch {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Mode UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    if ( !defined $Param{ParentID} ) {
        $Param{ParentID} = 0;
    }

    my $CategoryListCategories = $Self->CategoryList(
        Valid  => 1,
        UserID => $Param{UserID},
    );

    return [] if !$CategoryListCategories->{ $Param{ParentID} };

    my %Category = %{ $CategoryListCategories->{ $Param{ParentID} } };
    my @CategoryIDs = sort { $Category{$a} cmp $Category{$b} } ( keys %Category );
    my @AllowedCategoryIDs;

    # build valid id string
    my $ValidIDsString = join ', ', $Kernel::OM->Get('Kernel::System::Valid')->ValidIDsGet();

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    for my $CategoryID (@CategoryIDs) {

        # get all subcategory ids for this category
        my $SubCategoryIDs = $Self->CategorySubCategoryIDList(
            ParentID     => $CategoryID,
            Mode         => $Param{Mode},
            CustomerUser => $Param{CustomerUser},
            UserID       => $Param{UserID},
        );

        # add this category id
        my @IDs = ( $CategoryID, @{$SubCategoryIDs} );

        # check if category contains articles with state public
        my $FoundArticle = 0;

        my $SQL = "
            SELECT faq_item.id
            FROM faq_item, faq_state_type, faq_state
            WHERE faq_item.category_id = ?
                AND faq_item.valid_id IN ($ValidIDsString)
                AND faq_state.id = faq_item.state_id
                AND faq_state.type_id = faq_state_type.id
                AND faq_state_type.name = 'public'
                AND faq_item.approved = 1";

        ID:
        for my $ID (@IDs) {

            return if !$DBObject->Prepare(
                SQL   => $SQL,
                Bind  => [ \$ID ],
                Limit => 1,
            );
            while ( my @Row = $DBObject->FetchrowArray() ) {
                $FoundArticle = $Row[0];
            }
            last ID if $FoundArticle;
        }

        # an article was found
        if ($FoundArticle) {
            push @AllowedCategoryIDs, $CategoryID;
        }
    }

    return \@AllowedCategoryIDs;

}

=item GetUserCategories()

get user category-groups

    my $UserCategoryGroupHashRef = $FAQObject->GetUserCategories(
        Type   => 'rw',
        UserID => 1,
    );

Returns:

    $UserCategoryGroupHashRef = {
        1 => {},
        0 => {
            1 => 'Misc',
            2 => 'My Category',
        },
        2 => {
            3 => 'Sub Category A',
            4 => 'Sub Category B',
        },
        3 => {},
        4 => {},
    };

=cut

sub GetUserCategories {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Type UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    my $Categories = $Self->CategoryList(
        Valid  => 1,
        UserID => $Param{UserID},
    );

    my $CategoryGroups = $Self->CategoryGroupGetAll(
        UserID => $Param{UserID},
    );
    my %UserGroups;
    if ( !$Self->{Cache}->{GetUserCategories}->{GroupMemberList} ) {
        %UserGroups = $Kernel::OM->Get('Kernel::System::Group')->GroupMemberList(
            UserID => $Param{UserID},
            Type   => $Param{Type},
            Result => 'HASH',
        );
        $Self->{Cache}->{GetUserCategories}->{GroupMemberList} = \%UserGroups;
    }
    else {
        %UserGroups = %{ $Self->{Cache}->{GetUserCategories}->{GroupMemberList} };
    }

    my $UserCategories = $Self->_UserCategories(
        Categories     => $Categories,
        CategoryGroups => $CategoryGroups,
        UserGroups     => \%UserGroups,
        UserID         => $Param{UserID},
    );

    return $UserCategories;
}

=item GetUserCategoriesLongNames()

get user category-groups (show category long names)

    my $UserCategoryGroupHashRef = $FAQObject->GetUserCategoriesLongNames(
        Type   => 'rw',
        UserID => 1,
    );

Returns:

    $UserCategoryGroupHashRef = {
        1 => 'Misc',
        2 => 'My Category',
        3 => 'My Category::Sub Category A',
        4 => 'My Category::Sub Category A',
    };

=cut

sub GetUserCategoriesLongNames {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Type UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    # get categories where user has rights
    my $UserCategories = $Self->GetUserCategories(
        Type   => $Param{Type},
        UserID => $Param{UserID},
    );

    # get all categories with their long names
    my $CategoryTree = $Self->CategoryTreeList(
        Valid  => 1,
        UserID => $Param{UserID},
    );

    # to store the user categories with their long names
    my %UserCategoriesLongNames;

    # get the long names of the categories where user has rights
    PARENTID:
    for my $ParentID ( sort keys %{$UserCategories} ) {

        next PARENTID if !$UserCategories->{$ParentID};
        next PARENTID if ref $UserCategories->{$ParentID} ne 'HASH';
        next PARENTID if !%{ $UserCategories->{$ParentID} };

        for my $CategoryID ( sort keys %{ $UserCategories->{$ParentID} } ) {
            $UserCategoriesLongNames{$CategoryID} = $CategoryTree->{$CategoryID};
        }
    }

    return \%UserCategoriesLongNames;
}

=item GetCustomerCategories()

get customer user categories

    my $CustomerUserCategoryHashRef = $FAQObject->GetCustomerCategories(
        CustomerUser => 'hans',
        Type         => 'rw',
        UserID       => 1,
    );

Returns:

    $CustomerUserCategoryHashRef = {
        1 => {},
        0 => {
            1 => 'Misc',
            2 => 'My Category',
        },
        2 => {
            3 => 'Sub Category A',
            4 => 'Sub Category B',
        },
        3 => {},
        4 => {},
    };

=cut

sub GetCustomerCategories {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(CustomerUser Type UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    # check cache
    my $CacheKey = 'GetCustomerCategories::CustomerUser::' . $Param{CustomerUser};
    if ( defined $Self->{Cache}->{$CacheKey} ) {
        return $Self->{Cache}->{$CacheKey};
    }

    # get all valid categories
    my $Categories = $Self->CategoryList(
        Valid  => 1,
        UserID => $Param{UserID},
    );

    my $CategoryGroups = $Self->CategoryGroupGetAll(
        UserID => $Param{UserID},
    );

    my %UserGroups = $Kernel::OM->Get('Kernel::System::CustomerGroup')->GroupMemberList(
        UserID => $Param{CustomerUser},
        Type   => 'ro',
        Result => 'HASH',
    );

    my $CustomerCategories = $Self->_UserCategories(
        Categories     => $Categories,
        CategoryGroups => $CategoryGroups,
        UserGroups     => \%UserGroups,
        UserID         => $Param{UserID},
    );

    # cache
    $Self->{Cache}->{$CacheKey} = $CustomerCategories;

    return $CustomerCategories;
}

=item GetCustomerCategoriesLongNames()

get customer category-groups (show category long names)

    my $CustomerCategoryGroupHashRef = $FAQObject->GetCustomerCategoriesLongNames(
        CustomerUser => 'hans',
        Type   => 'rw',
        UserID => 1,
    );

Returns:

    $CustomerCategoryGroupHashRef = {
        1 => 'Misc',
        2 => 'My Category',
        3 => 'My Category::Sub Category A',
        4 => 'My Category::Sub Category A',
    };

=cut

sub GetCustomerCategoriesLongNames {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(CustomerUser Type UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    # get categories where user has rights
    my $CustomerCategories = $Self->GetCustomerCategories(
        CustomerUser => $Param{CustomerUser},
        Type         => $Param{Type},
        UserID       => $Param{UserID},
    );

    # extract category ids
    my %AllCategoryIDs;
    for my $ParentID ( sort keys %{$CustomerCategories} ) {
        for my $CategoryID ( sort keys %{ $CustomerCategories->{$ParentID} } ) {
            $AllCategoryIDs{$CategoryID} = 1;
        }
    }

    # get all customer category ids
    my @CustomerCategoryIDs;
    for my $CategoryID ( 0, keys %AllCategoryIDs ) {
        push @CustomerCategoryIDs, @{
            $Self->CustomerCategorySearch(
                ParentID     => $CategoryID,
                CustomerUser => $Param{CustomerUser},
                Mode         => 'Customer',
                UserID       => $Param{UserID},
                )
        };
    }

    # build customer category hash
    $CustomerCategories = {};
    for my $CategoryID (@CustomerCategoryIDs) {
        my %Category = $Self->CategoryGet(
            CategoryID => $CategoryID,
            UserID     => $Param{UserID},
        );
        $CustomerCategories->{ $Category{ParentID} }->{ $Category{CategoryID} } = $Category{Name};
    }

    # get all categories with their long names
    my $CategoryTree = $Self->CategoryTreeList(
        Valid  => 1,
        UserID => $Param{UserID},
    );

    # to store the user categories with their long names
    my %CustomerCategoriesLongNames;

    # get the long names of the categories where user has rights
    PARENTID:
    for my $ParentID ( sort keys %{$CustomerCategories} ) {

        next PARENTID if !$CustomerCategories->{$ParentID};
        next PARENTID if ref $CustomerCategories->{$ParentID} ne 'HASH';
        next PARENTID if !%{ $CustomerCategories->{$ParentID} };

        for my $CategoryID ( sort keys %{ $CustomerCategories->{$ParentID} } ) {
            $CustomerCategoriesLongNames{$CategoryID} = $CategoryTree->{$CategoryID};
        }
    }

    return \%CustomerCategoriesLongNames;
}

=item GetPublicCategoriesLongNames()

get public category-groups (show category long names)

    my $PublicCategoryGroupHashRef = $FAQObject->GetPublicCategoriesLongNames(
        Type   => 'rw',
        UserID => 1,
    );

Returns:

    $PublicCategoryGroupHashRef = {
        1 => 'Misc',
        2 => 'My Category',
        3 => 'My Category::Sub Category A',
        4 => 'My Category::Sub Category A',
    };

=cut

sub GetPublicCategoriesLongNames {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Type UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    # get all categories
    my $PublicCategories = $Self->CategoryList( UserID => $Param{UserID} );

    # extract category ids
    my %AllCategoryIDs;
    for my $ParentID ( sort keys %{$PublicCategories} ) {
        for my $CategoryID ( sort keys %{ $PublicCategories->{$ParentID} } ) {
            $AllCategoryIDs{$CategoryID} = 1;
        }
    }

    # get all public category ids
    my @PublicCategoryIDs;
    for my $CategoryID ( 0, keys %AllCategoryIDs ) {
        push @PublicCategoryIDs, @{
            $Self->PublicCategorySearch(
                ParentID => $CategoryID,
                Mode     => 'Public',
                UserID   => $Param{UserID},
                )
        };
    }

    # build public category hash
    $PublicCategories = {};
    for my $CategoryID (@PublicCategoryIDs) {
        my %Category = $Self->CategoryGet(
            CategoryID => $CategoryID,
            UserID     => $Param{UserID},
        );
        $PublicCategories->{ $Category{ParentID} }->{ $Category{CategoryID} } = $Category{Name};
    }

    # get all categories with their long names
    my $CategoryTree = $Self->CategoryTreeList(
        Valid  => 1,
        UserID => $Param{UserID},
    );

    # to store the user categories with their long names
    my %PublicCategoriesLongNames;

    # get the long names of the categories where user has rights
    PARENTID:
    for my $ParentID ( sort keys %{$PublicCategories} ) {

        next PARENTID if !$PublicCategories->{$ParentID};
        next PARENTID if ref $PublicCategories->{$ParentID} ne 'HASH';
        next PARENTID if !%{ $PublicCategories->{$ParentID} };

        for my $CategoryID ( sort keys %{ $PublicCategories->{$ParentID} } ) {
            $PublicCategoriesLongNames{$CategoryID} = $CategoryTree->{$CategoryID};
        }
    }

    return \%PublicCategoriesLongNames;
}

=item CheckCategoryUserPermission()

get user permission for a category

    my $PermissionString = $FAQObject->CheckCategoryUserPermission(
        CategoryID => '123',
        UserID     => 1,
    );

Returns:

    $PermissionString = 'rw';               # or 'ro' or ''

=cut

sub CheckCategoryUserPermission {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(CategoryID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    my $UserCategories = $Self->GetUserCategories(
        Type   => 'ro',
        UserID => $Param{UserID},
    );

    for my $Permission (qw(rw ro)) {
        for my $ParentID ( sort keys %{$UserCategories} ) {
            my $Categories = $UserCategories->{$ParentID};
            for my $CategoryID ( sort keys %{$Categories} ) {
                if ( $CategoryID == $Param{CategoryID} ) {

                    return $Permission;
                }
            }
        }
    }

    return '';
}

=item CheckCategoryCustomerPermission()

get customer user permission for a category

    my $PermissionString $FAQObject->CheckCategoryCustomerPermission(
        CustomerUser => 'mm',
        CategoryID   => '123',
        UserID       => 1,
    );

Returns:

    $PermissionString = 'rw';               # or 'ro' or ''

=cut

sub CheckCategoryCustomerPermission {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(CustomerUser CategoryID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    for my $Permission (qw(rw ro)) {
        my $CustomerCategories = $Self->GetCustomerCategories(
            CustomerUser => $Param{CustomerUser},
            Type         => 'ro',
            UserID       => $Param{UserID},
        );
        for my $ParentID ( sort keys %{$CustomerCategories} ) {
            my $Categories = $CustomerCategories->{$ParentID};
            for my $CategoryID ( sort keys %{$Categories} ) {
                if ( $CategoryID == $Param{CategoryID} ) {

                    return $Permission;
                }
            }
        }
    }

    return '';
}

=item SetCategoryGroup()

set groups to a category

    my $Success = $FAQObject->SetCategoryGroup(
        CategoryID => 3,
        GroupIDs   => [ 2,4,1,5,77 ],
        UserID     => 1,
    );

Returns:

    $Success = 1;               # or undef if groups could not be set to a category

=cut

sub SetCategoryGroup {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(CategoryID GroupIDs UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # delete old groups
    return if !$DBObject->Do(
        SQL => '
            DELETE FROM faq_category_group
            WHERE category_id = ?',
        Bind => [ \$Param{CategoryID} ],
    );

    # insert groups
    $Param{CategoryID} = $DBObject->Quote( $Param{CategoryID}, 'Integer' );
    for my $GroupID ( @{ $Param{GroupIDs} } ) {

        # db quote
        $GroupID = $DBObject->Quote( $GroupID, 'Integer' );

        my $SQL = "
            INSERT INTO faq_category_group (category_id, group_id, changed, changed_by, created,
                created_by)
            VALUES ($Param{CategoryID}, $GroupID, current_timestamp, $Param{UserID},
                current_timestamp, $Param{UserID})";

        # write attachment to db
        return if !$DBObject->Do( SQL => $SQL );
    }

    return 1;
}

=begin Internal:

=item _UserCategories()

reduces the categories ( from CategoryList() ) to only the ones where the user has privileges.

    my $UserCategories = $FAQObject->_UserCategories(
        Categories     => $CategoryHashRef,         # as returned form CategoryList()
        CategoryGroups => $CategoryGroupHashRef,     # as returned from CategoryGroupGetAll
        UserGroups     => $UserGroupsHashRef,
        UserID         => 123,
    );

Returns:

    $UserCategoies = {
        0 => {
            1 => 'Misc',
            2 => 'My Category',
        },
        2 => {
            3 => 'Sub Category A',
        },
    };

=cut

sub _UserCategories {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Categories UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    my %UserCategories;

    PARENTID:
    for my $ParentID ( sort { $a <=> $b } keys %{ $Param{Categories} } ) {

        my %SubCategories;

        CATEGORYID:
        for my $CategoryID ( sort keys %{ $Param{Categories}->{$ParentID} } ) {

            # check category groups
            next CATEGORYID if !defined $Param{CategoryGroups}->{$CategoryID};

            # check user groups
            GROUPID:
            for my $GroupID ( sort keys %{ $Param{CategoryGroups}->{$CategoryID} } ) {

                next GROUPID if !defined $Param{UserGroups}->{$GroupID};

                # add category
                $SubCategories{$CategoryID} = $Param{Categories}->{$ParentID}->{$CategoryID};

                # add empty hash if category has no subcategories
                if ( !$UserCategories{$CategoryID} ) {
                    $UserCategories{$CategoryID} = {};
                }

                last GROUPID;
            }
        }
        $UserCategories{$ParentID} = \%SubCategories;
    }

    return \%UserCategories;
}

=end Internal:

=cut

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
