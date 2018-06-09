# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::FilterElementPost::FAQRelatedArticles;

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::Output::HTML::Layout',
    'Kernel::System::FAQ',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $TemplateName = $Param{TemplateFile} || '';

    return 1 if !$TemplateName;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    return 1 if !$ConfigObject->Get('FAQ::Customer::RelatedArticles::Enabled');

    my $OutputFilterPostConfigs = $ConfigObject->Get('Frontend::Output::FilterElementPost');

    return if !$OutputFilterPostConfigs;
    return if ref $OutputFilterPostConfigs ne 'HASH';

    # Extract the output filter config.
    my $OutputFilterConfig = $OutputFilterPostConfigs->{OutputFilterPostFAQRelatedArticles};

    return if !$OutputFilterConfig;
    return if ref $OutputFilterConfig ne 'HASH';

    my $ValidTemplates = $OutputFilterConfig->{Templates};

    return if !$ValidTemplates;
    return if ref $ValidTemplates ne 'HASH';

    # Apply only if template is valid in config.
    return 1 if !$ValidTemplates->{$TemplateName};

    my $FAQObject = $Kernel::OM->Get('Kernel::System::FAQ');

    my %FAQSearchParameter;

    # Set interface setting to 'external', to search only for approved faq article.
    $FAQSearchParameter{Interface} = $FAQObject->StateTypeGet(
        Name   => 'external',
        UserID => 1,
    );

    $FAQSearchParameter{States} = $FAQObject->StateTypeList(
        Types  => $ConfigObject->Get('FAQ::Customer::StateTypes'),
        UserID => 1,
    );

    # Test if customer/public FAQ article exists, because we don't show the widget
    #   if no relevant article exists.
    my @FAQArticleIDs = $FAQObject->FAQSearch(
        %FAQSearchParameter,
        Limit  => 1,
        UserID => 1,
    );

    return 1 if !@FAQArticleIDs;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # Render the empty related FAQ article list and add the initial wdiget html code to the page.
    my $CustomerRelatedFAQArticlesHTMLString = $LayoutObject->Output(
        TemplateFile => 'CustomerFAQRelatedArticles',
        Data         => {},
    );

    my $Search = '(<div id="RichTextServerError"[^>]*>.*?<\/div>)(\s*<div class="Clear"><\/div>\s*<\/div>)';
    ${ $Param{Data} }
        =~ s{$Search}{$1<div id="FAQRelatedArticles" class="Hidden">$CustomerRelatedFAQArticlesHTMLString</div>$2}msg;

    my $FrontendCustomerTicketMessageConfig      = $ConfigObject->Get("Ticket::Frontend::CustomerTicketMessage");
    my $FrontendCustomerFAQRelatedArticlesConfig = $ConfigObject->Get("FAQ::Frontend::CustomerFAQRelatedArticles");

    my $QueuesEnabled = $FrontendCustomerFAQRelatedArticlesConfig->{'QueuesEnabled'} || '';
    my $QueuesEnabledStrg = '';
    if ( IsArrayRefWithData($QueuesEnabled) ) {

  # Don't show the functionality, if the queue selection is disabled and the default queue is not in the enabled queues.
        if ( !$FrontendCustomerTicketMessageConfig->{Queue} ) {
            my %LookupQuquesEnabled = map { $_ => 1 } @{$QueuesEnabled};

            return
                if !$FrontendCustomerTicketMessageConfig->{QueueDefault}
                || !$LookupQuquesEnabled{ $FrontendCustomerTicketMessageConfig->{QueueDefault} };
        }
        else {
            $QueuesEnabledStrg = join( "','", @{$QueuesEnabled} );
            $QueuesEnabledStrg = "'$QueuesEnabledStrg'";
        }
    }

    # TODO the JS should be moved in a own JS file with OTRS 6!
    # inject the necessary JS into the template
    $LayoutObject->AddJSOnDocumentComplete( Code => <<"EOF");
var QueuesEnabled = [ $QueuesEnabledStrg ],
LastData;

\$('#Dest').on('change.RelatedFAQArticle', function () {
    var SelectedQueue = \$(this).val(),
        SelectedQueueName = SelectedQueue.replace(/\\d*\\|\\|-?/, '');

    if ( \$('#FAQRelatedArticles').hasClass('Hidden') && (!QueuesEnabled.length || !SelectedQueueName || \$.inArray(SelectedQueueName, QueuesEnabled) > -1) ) {
        \$('#FAQRelatedArticles').removeClass('Hidden');

        if (\$('#Subject').val() || CKEDITOR.instances['RichText'].getData()) {
            \$('#Subject').trigger('change');
        }
    }
    else if ( !SelectedQueueName || ( QueuesEnabled.length && \$.inArray(SelectedQueueName, QueuesEnabled) == -1 ) ) {
        \$('#FAQRelatedArticles').addClass('Hidden');
    }
});

\$('#Subject').on('change', function (Event) {
    var SelectedQueue = \$('#Dest').val(),
        SelectedQueueName,
        Data;

    if (SelectedQueue) {
        SelectedQueue.replace(/\\d*\\|\\|-?/, '')
    }

    if ( !QueuesEnabled.length || !SelectedQueueName || \$.inArray(SelectedQueueName, QueuesEnabled) > -1 ) {

        Data = {
            Action: 'CustomerFAQRelatedArticles',
            Subject: \$('#Subject').val(),
            Body: CKEDITOR.instances['RichText'].getData()
        };

        if ( !LastData || LastData.Subject != Data.Subject || LastData.Body != Data.Body ) {

            if (!\$('.FAQMiniList').length) {
                \$('#FAQRelatedArticles .Content').html('<div class="Center"><span class="AJAXLoader" title="' + Core.Config.Get('LoadingMsg') + '"></span></div>');
            }
            else if (!\$('#FAQRelatedArticles .Header .AJAXLoader').length) {
                \$('#FAQRelatedArticles .Header h3').after('<span class="AJAXLoader" style="float: right; margin: 0;" title="' + Core.Config.Get('LoadingMsg') + '"></span>');
            }

            if (\$('#Subject').data('RelatedFAQArticlesXHR')) {

                \$('#Subject').data('RelatedFAQArticlesXHR').abort();
                \$('#Subject').removeData('RelatedFAQArticlesXHR');
            }

            \$('#Subject').data('RelatedFAQArticlesXHR', Core.AJAX.FunctionCall(Core.Config.Get('Baselink'), Data, function (Response) {

                \$('#Subject').removeData('RelatedFAQArticlesXHR');

                // Remeber the last data to execute the ajax request only if necessary.
                LastData = Data;

                if ( \$('#FAQRelatedArticles').length ) {

                    \$('#FAQRelatedArticles').html(Response.CustomerRelatedFAQArticlesHTMLString);
                }
            }));
        }
    }
});

\$('#Subject').on('paste keydown', function (Event) {
    var Value = \$('#Subject').val();

    // trigger only the change event for the subject, if space or enter was pressed
    if (( Event.type === 'keydown' && ( Event.which == 32 || Event.which == 13 ) && ( Value.length > 10 || CKEDITOR.instances['RichText'].getData())) || Event.type !== 'keydown') {
        \$('#Subject').trigger('change');
    }
});

// The "change" event is fired whenever a change is made in the editor.
CKEDITOR.instances['RichText'].on( 'key', function (Event) {

    // trigger only the change event for the subject, if space or enter was pressed
    if ( Event.data.keyCode == 32 || Event.data.keyCode == 13) {
        \$('#Subject').trigger('change');
    }
});

// The "paste" event is fired whenever a paste is made in the editor.
CKEDITOR.instances['RichText'].on( 'paste', function (Event) {

    // trigger only the change event for the subject
    \$('#Subject').trigger('change');
});

// The "blur" event is fired whenever a blur is made in the editor.
CKEDITOR.instances['RichText'].on( 'blur', function (Event) {

    // trigger only the change event for the subject
    \$('#Subject').trigger('change');
});

// Trigger the 'RelatedFAQArticle' change event to hide/show the relatd faq article widget for the case
//  that the queue is already selected at the page load or show the widget always if the queue selection is disabled.
if ( !\$('#Dest').length ) {
     \$('#FAQRelatedArticles').removeClass('Hidden');

    if (\$('#Subject').val() || CKEDITOR.instances['RichText'].getData()) {
        \$('#Subject').trigger('change');
    }
}
else {
    \$('#Dest').trigger('change.RelatedFAQArticle');
}

EOF

    return 1;
}

1;
