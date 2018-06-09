// --
// Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (AGPL). If you
// did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
// --

"use strict";

var ITSM = ITSM || {};
ITSM.Agent = ITSM.Agent || {};

/**
 * @namespace
 * @exports TargetNS as ITSM.Agent.IncidentState
 * @description
 *      This namespace contains the special module functions for IncidentState.
 */
ITSM.Agent.IncidentState = (function (TargetNS) {

    TargetNS.ShowIncidentState = function (Data) {

        Data.Subaction = 'GetServiceIncidentState';

        Core.AJAX.FunctionCall(Core.Config.Get('Baselink'), Data, function (Response) {

            // if a service was selected and an incident state was found
            if (Response.CurInciSignal) {

                // set incident signal
                $('#ServiceIncidentStateSignal').attr('class', Response.CurInciSignal);
                $('#ServiceIncidentStateSignal').attr('title', Response.CurInciState);

                // set incident state
                $('#ServiceIncidentState').html(Response.CurInciState);

                // show service incident signal and state
                $('#ServiceIncidentStateContainer')
                    .show()
                    .prev()
                    .show();
            }
            else {
                // hide service incident signal and state
                $('#ServiceIncidentStateContainer')
                    .hide()
                    .prev()
                    .hide();
            }
        });
    };

    return TargetNS;
}(ITSM.Agent.IncidentState || {}));
