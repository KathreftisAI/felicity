// --
// Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
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

/**
 * @namespace
 * @exports TargetNS as ITSM.Agent.UserSearch
 * @description
 *      This namespace contains the special module functions for the user search.
 */
ITSM.Agent.UserSearch = (function (TargetNS) {

    /**
     * @function
     * @param {jQueryObject} $Element The jQuery object of the input field with autocomplete
     * @return nothing
     *      This function initializes the special module functions
     */
    TargetNS.Init = function ($Element) {

        if (isJQueryObject($Element)) {

            Core.UI.Autocomplete.Init(
                $Element,
                function (Request, Response) {
                    var URL = Core.Config.Get('Baselink'), Data = {
                        Action: 'AgentITSMUserSearch',
                        Term: Request.term + '*',
                        Groups : Core.Config.Get('UserAutocomplete.Groups') || '',
                        MaxResults: Core.UI.Autocomplete.GetConfig('MaxResultsDisplayed'),
                        ITSMChangeGroupID: ITSMChangeGroupIDData
                    };

                    $Element.data('AutoCompleteXHR', Core.AJAX.FunctionCall(URL, Data, function (Result) {
                        var Data = [];
                        $.each(Result, function () {
                            Data.push({
                                label: this.UserValue + " (" + this.UserKey + ")",
                                value: this.UserValue
                            });
                        });
                        Response(Data);
                    }));
                },
                function (Event, UI) {

                    var UserKey = UI.item.label.replace(/.*\((.*)\)$/, '$1');

                    $Element.val(UI.item.value);

                    // set hidden field SelectedUser
                    $('#' + Core.App.EscapeSelector($Element.attr('id')) + 'Selected').val(UserKey);

                    return false;
                },
                'CustomerSearch'
            );
        }

        // On unload remove old selected data. If the page is reloaded (with F5) this data stays in the field and invokes an ajax request otherwise
        $(window).on('beforeunload.UserSearch', function () {
            // escape possible colons (:) in element id because jQuery can not handle it in id attribute selectors
            $('#' + Core.App.EscapeSelector($Element.attr('id')) + 'Selected').val('');
            return;
        });
    };

    return TargetNS;
}(ITSM.Agent.UserSearch || {}));
