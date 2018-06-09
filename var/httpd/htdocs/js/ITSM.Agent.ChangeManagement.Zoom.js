// --
// Copyright (C) 2001-2017 OTRS AG, http://otrs.com/\n";
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (AGPL). If you
// did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
// --


// TODO:
//Remove this line and fix JSDoc
// nofilter(TidyAll::Plugin::OTRS::JavaScript::ESLint)


"use strict";

var ITSM = ITSM || {};
ITSM.Agent = ITSM.Agent || {};
ITSM.Agent.ChangeManagement = ITSM.Agent.ChangeManagement || {};

/**
 * @namespace
 * @exports TargetNS as Core.Agent.ChangeManagement.Zoom
 * @description
 *      This namespace contains the special module functions for the Zoom (change and workorder zoom).
 */
ITSM.Agent.ChangeManagement.Zoom = (function (TargetNS) {

    /**
     * @function
     * @param {jQueryObject} $Iframe The iframe which should be auto-heighted
     * @return nothing
     *      This function initializes the special module functions
     */
    TargetNS.IframeAutoHeight = function ($Iframe) {

        if (isJQueryObject($Iframe)) {
            var NewHeight = $Iframe
                .contents()
                .find('html')
                .height();

            // IE8 needs some more space due to incorrect height calculation
            if (NewHeight > 0 && $.browser.msie && $.browser.version === '8.0') {
                NewHeight = NewHeight + 4;
            }

            // if the iFrames height is 0, we collapse the widget
            if (NewHeight === 0) {
                $Iframe.closest('.WidgetSimple').removeClass('Expanded').addClass('Collapsed');
            }

            if (!NewHeight || isNaN(NewHeight)) {
                NewHeight = Core.Config.Get('ITSMChange::Frontend::AgentHTMLFieldHeightDefault');
            }
            else {
                if (NewHeight > Core.Config.Get('ITSMChange::Frontend::AgentHTMLFieldHeightMax')) {
                    NewHeight = Core.Config.Get('ITSMChange::Frontend::AgentHTMLFieldHeightMax');
                }
            }
            $Iframe.height(NewHeight + 'px');
        }
    };

    // init browser link message close button
    if ($('.ITSMMessageBrowser').length) {
        $('.ITSMMessageBrowser a.Close').on('click', function () {
            $('.ITSMMessageBrowser').fadeOut("slow");
            Core.Agent.PreferencesUpdate('UserAgentDoNotShowBrowserLinkMessage', 1);
            return false;
        });
    }

    return TargetNS;

}(ITSM.Agent.ChangeManagement.Zoom || {}));
