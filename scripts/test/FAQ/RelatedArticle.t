# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

## no critic (Modules::RequireExplicitPackage)
use strict;
use warnings;

use vars qw($Self);

$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);
my $Helper       = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
my $FAQObject    = $Kernel::OM->Get('Kernel::System::FAQ');

# set config options
$ConfigObject->Set(
    Key   => 'FAQ::ApprovalRequired',
    Value => 0,
);

$ConfigObject->Set(
    Key   => 'CustomerGroupSupport',
    Value => 0,
);

# create some customer users
my @CustomerUsers;
for ( 0 .. 1 ) {
    my $TestUserLogin = $Helper->TestCustomerUserCreate();
    push @CustomerUsers, $TestUserLogin;
}

my $RandomNumber = $Helper->GetRandomNumber();

my %StateList = $FAQObject->StateList(
    UserID => 1,
);
my %ReverseStateList = reverse %StateList;

# Call this function at the beginning, to check if the cache cleanup works correctly after new article was created.
$FAQObject->FAQKeywordCustomerArticleList(
    CustomerUser => $CustomerUsers[0],
    UserID       => 1,
);

# define the tickets for the statistic result tests
my @FAQItems = (
    {
        Title      => 'Some Text',
        CategoryID => 1,
        StateID    => $ReverseStateList{'external (customer)'},    # 'external'
        LanguageID => 1,                                           # 'en'
        Keywords =>
            "ticket$RandomNumber keyword$RandomNumber itsm$RandomNumber example$RandomNumber $RandomNumber.$RandomNumber",
        Field1      => 'Problem...',
        Field2      => 'Solution...',
        ContentType => 'text/html',
        UserID      => 1,
    },
    {
        Title       => 'Some Text Example',
        CategoryID  => 1,
        StateID     => $ReverseStateList{'external (customer)'},    # 'external'
        LanguageID  => 1,                                           # 'en'
        Keywords    => "faq$RandomNumber keyword$RandomNumber",
        Field1      => 'Problem...',
        Field2      => 'Solution...',
        ContentType => 'text/html',
        UserID      => 1,
    },
    {
        Title       => 'Some Text Example',
        CategoryID  => 1,
        StateID     => $ReverseStateList{'external (customer)'},                    # 'external'
        LanguageID  => 2,                                                           # 'de'
        Keywords    => "faq$RandomNumber keyword$RandomNumber ItSm$RandomNumber",
        Field1      => 'Problem...',
        Field2      => 'Solution...',
        ContentType => 'text/html',
        UserID      => 1,
    },
    {
        Title       => 'Some Text Public',
        CategoryID  => 1,
        StateID     => $ReverseStateList{'public (all)'},                             # 'public'
        LanguageID  => 1,                                                             # 'en'
        Keywords    => "FAQ$RandomNumber keyword$RandomNumber public$RandomNumber",
        Field1      => 'Problem...',
        Field2      => 'Solution...',
        ContentType => 'text/html',
        UserID      => 1,
    },
    {
        Title       => 'Some Text Internal',
        CategoryID  => 1,
        StateID     => $ReverseStateList{'internal (agent)'},                                               # 'internal'
        LanguageID  => 1,                                                                                   # 'en'
        Keywords    => "ticket$RandomNumber KeyWord$RandomNumber iTsm$RandomNumber internal$RandomNumber",
        Field1      => 'Problem...',
        Field2      => 'Solution...',
        ContentType => 'text/html',
        UserID      => 1,
    },
);

# Create some faq items for the test.
my @FAQItemIDs;

FAQITEM:
for my $FAQItem (@FAQItems) {

    my $FAQItemID = $FAQObject->FAQAdd(
        %{$FAQItem},
    );

    $Self->True(
        $FAQItemID,
        "FAQAdd() successful for test - FAQItemID $FAQItemID",
    );

    push @FAQItemIDs, $FAQItemID;
}

# Define some test for the function 'FAQKeywordCustomerArticleList'.
my @Tests = (
    {
        Description                   => 'Test does not contain all necessary data for FAQKeywordCustomerArticleList',
        Fails                         => 1,
        FAQKeywordCustomerArticleList => {},
        ReferenceData                 => {},
    },
    {
        Description                   => 'Test with a customer user for FAQKeywordCustomerArticleList',
        FAQKeywordCustomerArticleList => {
            CustomerUser => $CustomerUsers[0],
        },
        ReferenceData => {
            "$RandomNumber.$RandomNumber" => [
                $FAQItemIDs[0],
            ],
            "example$RandomNumber" => [
                $FAQItemIDs[0],
            ],
            "faq$RandomNumber" => [
                $FAQItemIDs[3],
                $FAQItemIDs[2],
                $FAQItemIDs[1],
            ],
            "itsm$RandomNumber" => [
                $FAQItemIDs[2],
                $FAQItemIDs[0],
            ],
            "keyword$RandomNumber" => [
                $FAQItemIDs[3],
                $FAQItemIDs[2],
                $FAQItemIDs[1],
                $FAQItemIDs[0],
            ],
            "public$RandomNumber" => [
                $FAQItemIDs[3],
            ],
            "ticket$RandomNumber" => [
                $FAQItemIDs[0],
            ],
        },
    },
    {
        Description => "Test with a customer user, but only with language 'en' for FAQKeywordCustomerArticleList",
        FAQKeywordCustomerArticleList => {
            CustomerUser => $CustomerUsers[0],
            Languages    => ['en'],
        },
        ReferenceData => {
            "example$RandomNumber" => [
                $FAQItemIDs[0],
            ],
            "faq$RandomNumber" => [
                $FAQItemIDs[3],
                $FAQItemIDs[1],
            ],
            "itsm$RandomNumber" => [
                $FAQItemIDs[0],
            ],
            "keyword$RandomNumber" => [
                $FAQItemIDs[3],
                $FAQItemIDs[1],
                $FAQItemIDs[0],
            ],
            "public$RandomNumber" => [
                $FAQItemIDs[3],
            ],
            "ticket$RandomNumber" => [
                $FAQItemIDs[0],
            ],
        },
    },
    {
        Description => "Test with a customer user, but only with language 'de' for FAQKeywordCustomerArticleList",
        FAQKeywordCustomerArticleList => {
            CustomerUser => $CustomerUsers[0],
            Languages    => ['de'],
        },
        ReferenceData => {
            "faq$RandomNumber" => [
                $FAQItemIDs[2],
            ],
            "itsm$RandomNumber" => [
                $FAQItemIDs[2],
            ],
            "keyword$RandomNumber" => [
                $FAQItemIDs[2],
            ],
        },
    },
    {
        Description => "Test with a customer user with language 'en' and 'de' for FAQKeywordCustomerArticleList",
        FAQKeywordCustomerArticleList => {
            CustomerUser => $CustomerUsers[0],
            Languages    => [ 'en', 'de' ],
        },
        ReferenceData => {
            "example$RandomNumber" => [
                $FAQItemIDs[0],
            ],
            "faq$RandomNumber" => [
                $FAQItemIDs[3],
                $FAQItemIDs[2],
                $FAQItemIDs[1],
            ],
            "itsm$RandomNumber" => [
                $FAQItemIDs[2],
                $FAQItemIDs[0],
            ],
            "keyword$RandomNumber" => [
                $FAQItemIDs[3],
                $FAQItemIDs[2],
                $FAQItemIDs[1],
                $FAQItemIDs[0],
            ],
            "public$RandomNumber" => [
                $FAQItemIDs[3],
            ],
            "ticket$RandomNumber" => [
                $FAQItemIDs[0],
            ],
        },
    },
);

# define test counter
my $TestCount = 1;

TEST:
for my $Test (@Tests) {

    # check FAQKeywordCustomerArticleList attribute
    if ( !$Test->{FAQKeywordCustomerArticleList} || ref $Test->{FAQKeywordCustomerArticleList} ne 'HASH' ) {

        $Self->True(
            0,
            "Test $TestCount: No FAQKeywordCustomerArticleList found for this test.",
        );

        next TEST;
    }

    # print test case description
    if ( $Test->{Description} ) {
        $Self->True(
            1,
            "Test $TestCount: $Test->{Description}",
        );
    }

    my %FAQKeywordCustomerArticleList = $FAQObject->FAQKeywordCustomerArticleList(
        %{ $Test->{FAQKeywordCustomerArticleList} },
        UserID => 1,
    );

    if ( $Test->{Fails} ) {
        $Self->False(
            %FAQKeywordCustomerArticleList ? 1 : 0,
            "Test $TestCount: FAQKeywordCustomerArticleList() - should fail.",
        );
    }
    else {

        for my $Keyword ( sort keys %{ $Test->{ReferenceData} } ) {

            $Self->IsDeeply(
                $FAQKeywordCustomerArticleList{$Keyword} || [],
                $Test->{ReferenceData}->{$Keyword},
                "Test $TestCount: FAQKeywordCustomerArticleList() - $Keyword - test the result",
            );
        }
    }
}
continue {
    $TestCount++;
}

# Check if the cache exists for the last function call.
my @LanguageIDs;

LANGUAGENAME:
for my $LanguageName ( @{ $Tests[-1]->{FAQKeywordCustomerArticleList}->{Languages} } ) {
    my $LanguageID = $FAQObject->LanguageLookup(
        Name => $LanguageName,
    );
    next LANGUAGENAME if !$LanguageID;

    push @LanguageIDs, $LanguageID;
}

my $CustomerCategoryIDs = $FAQObject->CustomerCategorySearch(
    CustomerUser => $Tests[-1]->{FAQKeywordCustomerArticleList}->{CustomerUser},
    Mode         => 'Customer',
    UserID       => 1,
);

my $CacheKey = 'FAQKeywordArticleList';

if (@LanguageIDs) {
    $CacheKey .= '::Language' . join '::', @LanguageIDs;
}
$CacheKey .= '::CategoryIDs' . join '::', @{$CustomerCategoryIDs};

my $LastFAQKeywordCustomerArticleListCache = $Kernel::OM->Get('Kernel::System::Cache')->Get(
    Type => 'FAQKeywordArticleList',
    Key  => $CacheKey,
);

for my $Keyword ( sort keys %{ $Tests[-1]->{ReferenceData} } ) {

    $Self->IsDeeply(
        $LastFAQKeywordCustomerArticleListCache->{$Keyword} || [],
        $Tests[-1]->{ReferenceData}->{$Keyword},
        "Test $TestCount: Cache - FAQKeywordCustomerArticleList() - $Keyword - test the result",
    );
}

# Define some test for the function 'RelatedCustomerArticleList'.
@Tests = (
    {
        Description                => 'Test does not contain all necessary data for RelatedCustomerArticleList',
        Fails                      => 1,
        RelatedCustomerArticleList => {
            Subject => '',
            Body    => '',
        },
        ReferenceData => {},
    },
    {
        Description                => 'Test with a keyword in the subject for RelatedCustomerArticleList',
        RelatedCustomerArticleList => {
            Subject => "itsm$RandomNumber",
            Body    => "$RandomNumber",
            UserID  => $CustomerUsers[0],
        },
        ReferenceData => [
            $FAQItemIDs[2],
            $FAQItemIDs[0],
        ],
    },

    # E.g.
    # Given Keyword from text (with counter):
    #   - itsm (3)
    #   - ticket (1)
    #   - keyword (1)
    # Result (FAQArticleID => Calculated Quantifier and ordering by change time and create time):
    #   - FAQArticle 1 => 5
    #   - FAQArticle 2 => 4
    #   - FAQArticle 4 => 1
    #   - FAQArticle 3 => 1
    {
        Description                => 'Test with some keywords in the subject and body for RelatedCustomerArticleList',
        RelatedCustomerArticleList => {
            Subject => "itsm$RandomNumber",
            Body    => "itsm$RandomNumber, ticket$RandomNumber keyword$RandomNumber ITSM$RandomNumber.",
            UserID  => $CustomerUsers[0],
        },
        ReferenceData => [
            $FAQItemIDs[0],
            $FAQItemIDs[2],
            $FAQItemIDs[3],
            $FAQItemIDs[1],
        ],
    },

    # E.g.
    # Given Keyword from text (with counter):
    #   - itsm (3)
    #   - ticket (1)
    #   - keyword (1)
    # Result (FAQArticleID => Calculated Quantifier and ordering by change time and create time):
    #   - FAQArticle 1 => 5
    #   - FAQArticle 2 => 4
    #   - FAQArticle 4 => 1
    #   - FAQArticle 3 => 1
    {
        Description =>
            'Test with some html keywords in the subject and body (with html and link) for RelatedCustomerArticleList',
        RelatedCustomerArticleList => {
            Subject => "itsm$RandomNumber",
            Body =>
                "$RandomNumber itsm$RandomNumber ticket$RandomNumber <br />keyword$RandomNumber ITSM$RandomNumber. [1] https://faq.com/",
            UserID => $CustomerUsers[0],
        },
        ReferenceData => [
            $FAQItemIDs[0],
            $FAQItemIDs[2],
            $FAQItemIDs[3],
            $FAQItemIDs[1],
        ],
    },

    # E.g.
    # Given Keyword from text (with counter):
    #   - itsm (3)
    #   - ticket (1)
    #   - keyword (1)
    # Result (FAQArticleID => Calculated Quantifier and ordering by change time and create time):
    #   - FAQArticle 2 => 1
    {
        Description                => "Test only for the language 'de' for RelatedCustomerArticleList",
        RelatedCustomerArticleList => {
            Subject   => "FAQ$RandomNumber.",
            Body      => "$RandomNumber",
            Languages => ['de'],
            UserID    => $CustomerUsers[0],
        },
        ReferenceData => [
            $FAQItemIDs[2],
        ],
    },

    # E.g.
    # Given Keyword from text (with counter):
    #   - itsm (3)
    #   - ticket (1)
    #   - keyword (1)
    # Result (FAQArticleID => Calculated Quantifier and ordering by change time and create time):
    #   - FAQArticle 1 => 5
    #   - FAQArticle 2 => 4
    {
        Description => 'Test with some keywords in the subject and body and a limit for RelatedCustomerArticleList',
        RelatedCustomerArticleList => {
            Subject => "itsm$RandomNumber",
            Body    => "itsm$RandomNumber; ticket$RandomNumber keyword$RandomNumber ITSM$RandomNumber.",
            Limit   => 2,
            UserID  => $CustomerUsers[0],
        },
        ReferenceData => [
            $FAQItemIDs[0],
            $FAQItemIDs[2],
        ],
    },

    # E.g.
    # Given Keyword from text (with counter):
    #   - RandomNumner.RandomNumer (2)
    #   - faq (1)
    # Result (FAQArticleID => Calculated Quantifier and ordering by change time and create time):
    #   - FAQArticle 1 => 2
    #   - FAQArticle 4 => 1
    {
        Description => 'Test with some keywords in the subject and body and a limit for RelatedCustomerArticleList',
        RelatedCustomerArticleList => {
            Subject => "$RandomNumber",
            Body    => "$RandomNumber.$RandomNumber faq$RandomNumber $RandomNumber.$RandomNumber.",
            Limit   => 2,
            UserID  => $CustomerUsers[0],
        },
        ReferenceData => [
            $FAQItemIDs[0],
            $FAQItemIDs[3],
        ],
    },
);

TEST:
for my $Test (@Tests) {

    # check RelatedCustomerArticleList attribute
    if ( !$Test->{RelatedCustomerArticleList} || ref $Test->{RelatedCustomerArticleList} ne 'HASH' ) {

        $Self->True(
            0,
            "Test $TestCount: No RelatedCustomerArticleList found for this test.",
        );

        next TEST;
    }

    # print test case description
    if ( $Test->{Description} ) {
        $Self->True(
            1,
            "Test $TestCount: $Test->{Description}",
        );
    }

    my @RelatedCustomerArticleList = $FAQObject->RelatedCustomerArticleList(
        %{ $Test->{RelatedCustomerArticleList} },
    );

    if ( $Test->{Fails} ) {
        $Self->False(
            @RelatedCustomerArticleList ? 1 : 0,
            "Test $TestCount: RelatedCustomerArticleList() - should fail.",
        );
    }
    else {

        my @RelatedFAQArticleIDs = map { $_->{ItemID} } @RelatedCustomerArticleList;

        $Self->IsDeeply(
            \@RelatedFAQArticleIDs,
            $Test->{ReferenceData},
            "Test $TestCount: RelatedCustomerArticleList() - test the result",
        );
    }
}
continue {
    $TestCount++;
}

# cleanup is done by restore database

1;
