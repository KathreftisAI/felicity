// --
// Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (AGPL). If you
// did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
// --

"use strict";

var FAQ = FAQ || {};
FAQ.Customer = FAQ.Customer || {};

/**
 * @namespace
 * @exports TargetNS as FAQ.Customer.TicketZoom
 * @description
 *      This namespace contains the special module functions for TicketZoom.
 */
FAQ.Customer.FAQZoom = (function (TargetNS) {

    /**
     * @name IframeAutoHeight
     * @memberof FAQ.Customer.FAQZoom
     * @function
     * @param {jQueryObject} $Iframe - The iframe which should be auto-heighted
     * @description
     *      Set iframe height automatically based on real content height and default config setting.
     */
     TargetNS.IframeAutoHeight = function ($Iframe) {
        var NewHeight;

        if (isJQueryObject($Iframe)) {
            // slightly change the width of the iframe to not be exactly 100% width anymore
            // this prevents a double horizontal scrollbar (from iframe and surrounding div)
            $Iframe.width($Iframe.width() - 2);

            NewHeight = $Iframe.contents().find('body').height();

            // if the iFrames height is 0, we collapse the widget
            if (NewHeight === 0) {
                $Iframe.closest('.WidgetSimple').removeClass('Expanded').addClass('Collapsed');
            } else if (!NewHeight || isNaN(NewHeight)) {
                NewHeight = Core.Config.Get('FAQ::Frontend::AgentHTMLFieldHeightDefault');
            }
            else {
                if (NewHeight > Core.Config.Get('FAQ::Frontend::AgentHTMLFieldHeightMax')) {
                    NewHeight = Core.Config.Get('FAQ::Frontend::AgentHTMLFieldHeightMax');
                }
            }

            // add delta for scrollbar
            if (NewHeight > 0) {
                NewHeight = parseInt(NewHeight, 10) + 25;
            }
            $Iframe.height(NewHeight + 'px');
        }
    };

    /**
     * @function
     * @memberof FAQ.Customer.FAQZoom
     * @param {jQueryObject} $Message - an FAQ field.
     * @description
     *      This function checks the class of a FAQ field:
     *      user calls this function by clicking on the field head, field gets hidden by removing
     *      the class 'Visible'. If the field head is clicked while it does not contain the class
     *      'Visible', the field gets the class 'Visible' again and it will be shown.
     */
    function ToggleMessage($Message){
        if ($Message.hasClass('Visible')) {
            $Message.removeClass('Visible');
        }
        else {
            $Message.addClass('Visible');
        }
    }

    /**
     * @function
     * @memberof FAQ.Customer.FAQZoom
     * @description
     *      This function binds functions to the 'MessageHeader'
     *      to toggle the visibility of the MessageBody and the reply form.
     */
    TargetNS.Init = function(){
        var $Messages = $('#Messages > li'),
            $MessageHeaders = $('.MessageHeader', $Messages);

        $MessageHeaders.click(function(Event){
            ToggleMessage($(this).parent());
            Event.preventDefault();
        });

        // init browser link message close button
        if ($('.FAQMessageBrowser').length) {
            $('.FAQMessageBrowser a.Close').on('click', function () {
                var Data = {
                    Action: 'CustomerFAQZoom',
                    Subaction: 'BrowserLinkMessage'
                };

                $('.FAQMessageBrowser').fadeOut("slow");

                // call server, to save that the button was closed and do not show it again on reload
                Core.AJAX.FunctionCall(
                    Core.Config.Get('CGIHandle'),
                    Data,
                    function () {}
                );

                return false;
            });
        }
    };

    return TargetNS;
}(FAQ.Customer.FAQZoom || {}));
