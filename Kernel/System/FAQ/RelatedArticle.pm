# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::FAQ::RelatedArticle;

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Log',
    'Kernel::System::HTMLUtils',
);

=head1 NAME

Kernel::System::FAQ::RelatedArticle - sub module of Kernel::System::FAQ

=head1 SYNOPSIS

All related faq article functions.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item RelatedArticleList()

Get the related faq article list for the given subject and body.

    my @RelatedArticleList = $FAQObject->RelatedArticleList(
        Subject   => 'Title Example',
        Body      => 'Text Example',  # possible with html tags (will be removed for the search)
        Languages =>[ 'en' ],         # optional
        Limit     => 10,              # optional
        UserID    => 1,
    );

Returns

    my @RelatedArticleList = (
        {
            ItemID       => 123,
            Title        => 'FAQ Title',
            CategoryName => 'Misc',
            Created      => '2014-10-10 10:10:00',
        },
        {
            ItemID       => 123,
            Title        => 'FAQ Title',
            CategoryName => 'Misc',
            Created      => '2014-10-10 10:10:00',
        },
    );

=cut

sub RelatedCustomerArticleList {
    my ( $Self, %Param ) = @_;

    for my $Needed (qw(UserID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # Get ASCII content form the given body, to have no html tags for the check.
    $Param{Body} = $Kernel::OM->Get('Kernel::System::HTMLUtils')->ToAscii(
        String => $Param{Body},
    );

    return if !$Param{Subject} && !$Param{Body};

    # To save the keywords and the counter for the different keywords.
    my %ContentKeywords;

    # Strip not wanted stuff from the given subject and body.
    for my $Field (qw(Subject Body)) {

        $Param{$Field} ||= '';

        # Remove the links from the content.
        $Param{$Field} = $Self->_RemoveLinksFromContent(
            Content => $Param{$Field},
        );

        # Split the text in word and save the word as the given keywords (separator is a whitespace).
        $Param{$Field} =~ s{[\.\,\;\:](\s|\s? \Z )}{ }xmsg;
        my @FieldKeywords = ( $Param{$Field} =~ m{ [\w\x{0980}-\x{09FF}\-]+\.?[\w\x{0980}-\x{09FF}\-]* }xmsg );

        KEYWORD:
        for my $Keyword (@FieldKeywords) {

            # Save the keywords always as lower case.
            $Keyword = lc $Keyword;

            # Increase the keyword counter from the text content, to increase the relevance for this keyword.
            $ContentKeywords{$Keyword}++;
        }
    }

    # Get the keyword article list for the given languages.
    my %FAQKeywordArticleList = $Self->FAQKeywordCustomerArticleList(
        CustomerUser => $Param{UserID},
        Languages    => $Param{Languages},
        UserID       => 1,
    );

    # Build the related faq articles and save a quantifier for the different articles with the relevance
    #   from the keyword, which is related to the faq article.
    # E.g.
    #   - FAQArticle 1 with keywords:  'itsm', 'changemanagement', 'ticket'
    #   - FAQArticle 2 with keywords: 'itsm', 'changemangement'
    #   - FAQArticle 3 with keywords: 'ticket'
    # Given Keyword from text (with counter):
    #   - changemanagement (5)
    #   - ticket (4)
    #   - itsm (1)
    # Result (FAQArticleID => Calculated Quantifier):
    #   - FAQArticle 1 => 11
    #   - FAQArticle 2 => 6
    #   - FAQArticle 3 => 4
    my %LookupRelatedFAQArticles;

    CONTENTKEYWORD:
    for my $ContentKeyword ( sort keys %ContentKeywords ) {

        next CONTENTKEYWORD if !IsArrayRefWithData( $FAQKeywordArticleList{$ContentKeyword} );

        FAQARTICLEID:
        for my $FAQArticleID ( @{ $FAQKeywordArticleList{$ContentKeyword} } ) {

            if ( !$LookupRelatedFAQArticles{$FAQArticleID} ) {

                my %FAQArticleData = $Self->FAQGet(
                    ItemID => $FAQArticleID,
                    UserID => $Param{UserID},
                );

                if ( $FAQArticleData{Votes} ) {
                    $FAQArticleData{StarCounter} = int( $FAQArticleData{VoteResult} * 0.05 );

                    # Add 1 because lowest value should be always 1.
                    if ( $FAQArticleData{StarCounter} < 5 ) {
                        $FAQArticleData{StarCounter}++;
                    }
                }

                # Add the FAQ article data to the related FAQ articles.
                $LookupRelatedFAQArticles{$FAQArticleID} = {
                    %FAQArticleData,
                    KeywordCounter => $ContentKeywords{$ContentKeyword},
                };
            }
            else {

                # Increase the quantifier, if the article has more then one relevant keyword.
                $LookupRelatedFAQArticles{$FAQArticleID}->{KeywordCounter} += $ContentKeywords{$ContentKeyword};
            }
        }
    }

    # To save the related faq article from the lookup hash.
    my @RelatedFAQArticleList = map { $LookupRelatedFAQArticles{$_} } sort keys %LookupRelatedFAQArticles;

    # Sort the results from the plug-ins by 'keyword quantifier', 'change time' and 'id (create time)'.
    @RelatedFAQArticleList = sort {
        $b->{KeywordCounter} <=> $a->{KeywordCounter} || $b->{Changed} cmp $a->{Changed} || $b->{ID} cmp $a->{ID}
    } @RelatedFAQArticleList;

    # Cut the not needed articles from the array, if a limit is given.
    if ( $Param{Limit} && scalar @RelatedFAQArticleList > $Param{Limit} ) {
        splice @RelatedFAQArticleList, $Param{Limit};
    }

    return @RelatedFAQArticleList;
}

=begin Internal:

=item _RemoveLinksFromContent()

Remove links from the given content.

    my $Content = $FAQObject->_RemoveLinksFromContent(
        Content => 'Some Text with a link. More text. [1] https://otrs.com/',
    );

Returns

    $Content = 'Some Text with a link. More text.';

=cut

sub _RemoveLinksFromContent {
    my ( $Self, %Param ) = @_;

    $Param{Content} =~ s{ \[\d*\] }{}xmsg;
    $Param{Content} =~ s{ https://[^\s]* }{}xmsg;

    return $Param{Content};
}

1;

=end Internal:

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
