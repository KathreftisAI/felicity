
package Kernel::Modules::AgentFAQSearchName;

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

=item Run()

perform PublicFAQSearch Operation. This will return a list of public FAQ entries.

    my @IDs = $OperationObject->Run(
        Data => {

            Number    => '*134*',                                         # (optional)
            Title     => '*some title*',                                  # (optional)

            # is searching in Number, Title, Keyword and Field1-6
            What      => '*some text*',                                   # (optional)

            Keyword   => '*webserver*',                                   # (optional)
            LanguageIDs => [ 4, 5, 6 ],                                   # (optional)
            CategoryIDs => [ 7, 8, 9 ],                                   # (optional)

            OrderBy => [ 'FAQID', 'Title' ],                              # (optional)

            # Additional information for OrderBy:
            # The OrderByDirection can be specified for each OrderBy attribute.
            # The pairing is made by the array indexes.

            OrderByDirection => 'Down', # (Down | Up)                         # (optional)
            # default: 'Down'
        },
    );


=cut


sub Run {
    my ( $Self, %Param ) = @_;

    my $JSON = '';

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # get param object
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

      # get config data
    # set SearchLimit on 0 because we need to get all entries
    my $SearchLimit = 0;

    # get config for frontend
    my $Config = $Kernel::OM->Get('Kernel::Config')->Get("FAQ::Frontend::AgentFAQSearch");

    my $SortBy = $ParamObject->GetParam( Param => 'OrderBy' )
        || $Config->{'SortBy::Default'}
        || 'FAQID';

    # the CategoryID param could be an ARRAY an SCALAR or an empty value
    if ( !IsArrayRefWithData($SortBy) && $SortBy ne '' ) {
        $SortBy = [$SortBy];
    }

    my $OrderBy = $ParamObject->GetParam( Param => 'OrderByDirection' ) 
        || $Config->{'Order::Default'}
        || 'Down';

    my $CategoryIDs;

    # the CategoryID param could be an ARRAY an SCALAR or an empty value
    $Param{Data}->{CategoryIDs} = $ParamObject->GetParam( Param => 'CategoryIDs' ) || '';
    if ( !IsArrayRefWithData( $Param{Data}->{CategoryIDs} ) && $Param{Data}->{CategoryIDs} ne '' ) {
        $CategoryIDs = [ $Param{Data}->{CategoryIDs} ];
    }
    elsif ( $Param{Data}->{CategoryIDs} ne '' ) {
        $CategoryIDs = $Param{Data}->{CategoryIDs};
    }

    my $LanguageIDs;

    # the LanguageID param could be an ARRAY an SCALAR or an empty value
    $Param{Data}->{LanguageIDs} = $ParamObject->GetParam( Param => 'LanguageIDs' ) || '';
    if ( !IsArrayRefWithData( $Param{Data}->{LanguageIDs} ) && $Param{Data}->{LanguageIDs} ne '' ) {
        $LanguageIDs = [ $Param{Data}->{LanguageIDs} ];
    }
    elsif ( $Param{Data}->{LanguageIDs} ne '' ) {
        $LanguageIDs = $Param{Data}->{LanguageIDs};
    }

    # get FAQ object
    my $FAQObject = $Kernel::OM->Get('Kernel::System::FAQ');

    # set UserID to root because in public interface there is no user
    my $UserID = 1;

    # set default interface settings
    my $Interface = $FAQObject->StateTypeGet(
        Name   => 'internal',
        UserID => $UserID,
    );
    my $InterfaceStates = $FAQObject->StateTypeList(
        Types  => $Kernel::OM->Get('Kernel::Config')->Get('FAQ::Agent::StateTypes'),
        UserID => $UserID,
    );

    # prepare return data
    my $ReturnData = {
        Data    => {},
        Success => 1,
    };
    my @FAQResult;


    # perform FAQ search
    my @ViewableFAQIDs = $FAQObject->FAQSearch(
        Number  => $ParamObject->GetParam( Param => 'Number' ) || '',
        Title   => $ParamObject->GetParam( Param => 'Title' ) || '',
        What    => $ParamObject->GetParam( Param => 'What' ) || '',
        Keyword => $ParamObject->GetParam( Param => 'Keyword' ) || '',
        LanguageIDs      => $LanguageIDs,
        CategoryIDs      => $CategoryIDs,
        OrderBy          => $SortBy,
        OrderByDirection => [$OrderBy],
        Limit            => $SearchLimit,
        UserID           => $UserID,
        States           => $InterfaceStates,
        Interface        => $Interface,
    );
    if ( !IsArrayRefWithData( \@ViewableFAQIDs ) ) {
         # return empty result
        $ReturnData->{Data}->{List} = \@FAQResult;
        return $ReturnData;
    }


    for my $Key (@ViewableFAQIDs){
         # get the FAQ entry
        my %FAQEntry = $FAQObject->FAQGet(
            ItemID     => $Key,
            ItemFields => 1,
            UserID     => 1,
        );
        push @FAQResult,
                {
                    'id'   => $Key,
                    'name' => $FAQEntry{Title},
                };
    }

    my %Result;
    $Result{List}=\@FAQResult;
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
