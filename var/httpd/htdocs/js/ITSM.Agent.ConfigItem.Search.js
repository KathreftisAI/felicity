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
ITSM.Agent.ConfigItem = ITSM.Agent.ConfigItem || {};

/**
 * @namespace
 * @exports TargetNS as ITSM.Agent.ConfigItem.Search
 * @description
 *      This namespace contains the special module functions for the search.
 */
ITSM.Agent.ConfigItem.Search = (function (TargetNS) {

    /**
     * @function
     * @return nothing
     *      This function rebuild attribute selection, only show available attributes.
     */
    TargetNS.AdditionalAttributeSelectionRebuild = function () {

        // get original selection with all possible fields and clone it
        var $AttributeClone = $('#AttributeOrig option').clone(),
            $AttributeSelection = $('#Attribute').empty(),
            Value;

        // strip all already used attributes
        $AttributeClone.each(function () {
            Value = Core.App.EscapeSelector($(this).attr('value'));
            if (!$('#SearchInsert label#Label' + Value).length) {
                $AttributeSelection.append($(this));
            }
        });

        $AttributeSelection.trigger('redraw.InputField');

        return true;
    };

    /**
     * @function
     * @param {String} of attribute to add.
     * @return nothing
     *      This function adds one attribute for search
     */
    TargetNS.SearchAttributeAdd = function (Attribute) {

        // escape possible colons (:) in element id because jQuery can not handle it in id attribute selectors
        Attribute = Core.App.EscapeSelector(Attribute);

        var $Label = $('#SearchAttributesHidden label#Label' + Attribute);

        if ($Label.length) {
            $Label.prev().clone().appendTo('#SearchInsert');
            $Label.clone().appendTo('#SearchInsert');
            $Label.next().clone().appendTo('#SearchInsert')

                // bind click function to remove button now
                .find('.RemoveButton').bind('click', function () {
                    var $Element = $(this).parent();
                    TargetNS.SearchAttributeRemove($Element);

                    // rebuild selection
                    TargetNS.AdditionalAttributeSelectionRebuild();

                    return false;
                });

                // set autocomplete to customer type fields
                $('#SearchInsert').find('.ITSMCustomerSearch').each(function() {
                    var InputID = $(this).attr('id') + 'Autocomplete';
                    $(this).removeClass('ITSMCustomerSearch');
                    $(this).attr('id', InputID);
                    $(this).prev().attr('id', InputID + 'Selected');

                    // escape possible colons (:) in element id because jQuery can not handle it in id attribute selectors
                    ITSM.Agent.CustomerSearch.Init( $('#' + Core.App.EscapeSelector(InputID) ) );

                    // prevent dialog closure when select a customer from the list
                    $('ul.ui-autocomplete').bind('click', function(Event) {
                        Event.stopPropagation();
                        return false;
                    });
                });
            }

        Core.UI.InputFields.Activate($('#SearchInsert'));

        return false;
    };

    /**
     * @function
     * @param {jQueryObject} $Element The jQuery object of the form  or any element
     *      within this form check.
     * @return nothing
     *      This function remove attributes from an element.
     */

    TargetNS.SearchAttributeRemove = function ($Element) {
        $Element.prev().prev().remove();
        $Element.prev().remove();
        $Element.remove();
    };

    /**
     * @function
     * @private
     * @param {String} Profile The profile name that will be delete.
     * @return nothing
     * @description Delete a profile via an ajax requests.
     */
    function SearchProfileDelete(Profile) {
        var Data = {
            Action: 'AgentITSMConfigItemSearch',
            Subaction: 'AJAXProfileDelete',
            Profile: Profile,
            ClassID: $('#SearchClassID').val()
        };
        Core.AJAX.FunctionCall(
            Core.Config.Get('CGIHandle'),
            Data,
            function () {}
        );
    }

    /**
     * @function
     * @private
     * @return nothing
     * @description Shows waiting dialog until search screen is ready.
     */
    function ShowWaitingDialog(){
        Core.UI.Dialog.ShowContentDialog('<div class="Spacing Center"><span class="AJAXLoader" title="' + Core.Config.Get('LoadingMsg') + '"></span></div>', Core.Config.Get('LoadingMsg'), '10px', 'Center', true);
    }

    /**
     * @function
     * @param none
     * @return nothing
     *      This function sets all search dialog settings
     */

    TargetNS.SetSearchDialog = function() {

        // hide add template block
        $('#SearchProfileAddBlock').hide();

        // hide save changes in template block
        $('#SaveProfile').parent().hide().prev().hide().prev().hide();

        // search profile is selected
        if ($('#SearchProfile').val() && $('#SearchProfile').val() !== 'last-search') {

            // show delete button
            $('#SearchProfileDelete').show();

            // show save changes in template block
            $('#SaveProfile').parent().show().prev().show().prev().show();

            // set SaveProfile to 0
            $('#SaveProfile').attr('checked', false);
        }

        // register add of attribute
        $('.AddButton').bind('click', function () {
            var Attribute = $('#Attribute').val();
            TargetNS.SearchAttributeAdd(Attribute);
            TargetNS.AdditionalAttributeSelectionRebuild();

            // Register event for tree selection dialog
            $('.ShowTreeSelection').unbind('click').bind('click', function () {
                Core.UI.TreeSelection.ShowTreeSelection($(this));
                return false;
            });

            return false;
        });

        // register return key
        $('#SearchForm').unbind('keypress.FilterInput').bind('keypress.FilterInput', function (Event) {
            if ((Event.charCode || Event.keyCode) === 13) {
                $('#SearchForm').submit();
                return false;
            }
        });

        // register submit
        $('#SearchFormSubmit').bind('click', function () {
            // Normal results mode will return HTML in the same window
            if ($('#SearchForm #ResultForm').val() === 'Normal') {
                $('#SearchForm').submit();
                ShowWaitingDialog();
            }
            else { // Print and CSV should open in a new window, no waiting dialog
                $('#SearchForm').attr('target', 'SearchResultPage');
                $('#SearchForm').submit();
                $('#SearchForm').attr('target', '');
            }
            return false;
        });

        // load profile
        $('#SearchProfile').bind('change', function () {
            var Profile = $('#SearchProfile').val();
            TargetNS.LoadProfile(Profile);
            return false;
        });

        // show add profile block or not
        $('#SearchProfileNew').bind('click', function (Event) {
            $('#SearchProfileAddBlock').toggle();
            Event.preventDefault();
            return false;
        });

        // add new profile
        $('#SearchProfileAddAction').bind('click', function () {
            var Name, $Element1, $Element2;

            // get name
            Name = $('#SearchProfileAddName').val();
            if (!Name) {
                return false;
            }

            // add name to profile selection
            $Element1 = $('#SearchProfile').children().first().clone();
            $Element1.text(Name);
            $Element1.attr('value', Name);
            $Element1.attr('selected', 'selected');
            $('#SearchProfile').append($Element1);

            // set input box to empty
            $('#SearchProfileAddName').val('');

            // hide add template block
            $('#SearchProfileAddBlock').hide();

            // hide save changes in template block
            $('#SaveProfile').parent().hide().prev().hide().prev().hide();

            // set SaveProfile to 1
            $('#SaveProfile').attr('checked', true);

            $('#SearchProfileDelete').show();

            return false;
        });

        // delete profile
        $('#SearchProfileDelete').bind('click', function (Event) {

            // strip all already used attributes
            $('#SearchProfile').find('option:selected').each(function () {
                if ($(this).attr('value') !== 'last-search') {

                    // rebuild attributes
                    $('#SearchInsert').text('');

                    // remove remote
                    SearchProfileDelete($(this).val());

                    // remove local
                    $(this).remove();

                    // rebuild selection
                    TargetNS.AdditionalAttributeSelectionRebuild();
                }
            });

            if ($('#SearchProfile').val() && $('#SearchProfile').val() === 'last-search') {
                $('#SearchProfileDelete').hide();
            }

            Event.preventDefault();
            return false;
        });

    };

    /**
     * @function
     * @param {Profile} The profile that is set to the search dialog
     * @return nothing
     *      This function refresh the search dialog with the selected profile
     */

    TargetNS.LoadProfile = function (Profile) {
        var BaseLink = Core.Config.Get('Baselink'),
            Action = 'Action=AgentITSMConfigItemSearch;',
            SubAction = 'Subaction=AJAXUpdate;',
            ClassID = 'ClassID=' + $('#SearchClassID').val() + ';',
            SearchProfile = 'Profile=' + Profile,
            URL =  BaseLink + Action + SubAction + ClassID + SearchProfile;

        $('#DivClassID').addClass('ui-autocomplete-loading');
        Core.AJAX.ContentUpdate($('#AJAXUpdate'), URL, function() {
            TargetNS.SetSearchDialog( '$Env{"Action"}' );
            $('#ITSMSearchProfile').removeClass('Hidden');
            $('#ITSMSearchFields').removeClass('Hidden');
            $('#SearchFormSubmit').removeClass('Hidden');
            $('#DivClassID').removeClass('ui-autocomplete-loading');
            Core.UI.InputFields.Activate($('#SearchForm'));
        });
    };

    /**
     * @function
     * @param {Event} Action
     * @return nothing
     *      This function open the search dialog
     */

    TargetNS.OpenSearchDialog = function (Action, Profile, Class) {

        var Referrer = Core.Config.Get('Action'),
            Data;

        if (!Action) {
            Action ='AgentITSMConfigItemSearch';
        }
        Data = {
            Action: Action,
            Referrer: Referrer,
            Profile: Profile,
            Subaction: 'AJAX',
            ClassID: Class
        };

        ShowWaitingDialog();

        Core.AJAX.FunctionCall(
            Core.Config.Get('CGIHandle'),
            Data,
            function (HTML) {
                // if the waiting dialog was canceled, do not show the search
                //  dialog as well
                if (!$('.Dialog:visible').length) {
                    return;
                }

                Core.UI.Dialog.ShowContentDialog(HTML, Core.Config.Get('SearchMsg'), '10px', 'Center', true, [], true);
                TargetNS.SetSearchDialog();
            }, 'html'
        );
    };

    return TargetNS;
}(ITSM.Agent.ConfigItem.Search || {}));
