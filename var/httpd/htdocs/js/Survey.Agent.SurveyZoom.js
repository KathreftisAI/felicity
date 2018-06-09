// --
// Copyright (C) 2001-2018 OTRS AG, http://otrs.com/\n";
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (AGPL). If you
// did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
// --

"use strict";

var Survey = Survey || {};
Survey.Agent = Survey.Agent || {};

/**
 * @namespace
 * @exports TargetNS as Survey.Agent.SurveyZoom
 * @description
 *      This namespace contains the special module functions for SurveyZoom.
 */
Survey.Agent.SurveyZoom = (function (TargetNS) {
    /**
     * @name IframeAutoHeight
     * @memberof Survey.Agent.SurveyZoom
     * @function
     * @param {jQueryObject} $Iframe - The iframe which should be auto-heighted
     * @description
     *      Set iframe height automatically based on real content height and default config setting.
     */
    TargetNS.IframeAutoHeight = function ($Iframe) {
        var NewHeight;

        if (isJQueryObject($Iframe)) {
            NewHeight = $Iframe.contents().height();
            if (!NewHeight || isNaN(NewHeight)) {
                NewHeight = Core.Config.Get('Survey.HTMLRichTextHeightDefault');
            }
            else {
                if (NewHeight > Core.Config.Get('Survey.HTMLRichTextHeightMax')) {
                    NewHeight = Core.Config.Get('Survey.HTMLRichTextHeightMax');
                }
            }
            $Iframe.height(NewHeight + 'px');
        }
    };

    return TargetNS;
}(Survey.Agent.SurveyZoom || {}));
