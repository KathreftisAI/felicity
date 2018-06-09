// --
// Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (AGPL). If you
// did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
// --

"use strict";

var FAQ = FAQ || {};
FAQ.Agent = FAQ.Agent || {};

/**
 * @namespace
 * @exports TargetNS as FAQ.Agent.TicketZoom
 * @description
 *      This namespace contains the special module functions for TicketZoom.
 */
FAQ.Agent.FAQZoom = (function (TargetNS) {

    /**
     * @name IframeAutoHeight
     * @memberof FAQ.Agent.FAQZoom
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

    // init browser link message close button
    if ($('.FAQMessageBrowser').length) {
        $('.FAQMessageBrowser a.Close').on('click', function () {
            $('.FAQMessageBrowser').fadeOut("slow");
            Core.Agent.PreferencesUpdate('UserAgentDoNotShowBrowserLinkMessage', 1);
            return false;
        });
    }

    return TargetNS;
}(FAQ.Agent.FAQZoom || {}));
