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
ITSM.Agent.ChangeManagement = ITSM.Agent.ChangeManagement || {};

/**
 * @namespace ITSM.Agent.ChangeManagement.Search
 * @memberof ITSM.Agent.ChangeManagement
 * @author OTRS AG
 * @description
 *      This namespace contains the special module functions for the ChangeManagement search.
 */
ITSM.Agent.ChangeManagement.Search = (function (TargetNS) {

    /**
     * @name AdditionalAttributeSelectionRebuild
     * @memberof ITSM.Agent.ChangeManagement.Search
     * @author OTRS AG
     * @function
     * @returns {Boolean} Returns true.
     * @description
            This function rebuilds the selection dropdown after choosing or deleting an additional selection.
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
     * @name SearchAttributeAdd
     * @memberof ITSM.Agent.ChangeManagement.Search
     * @author OTRS AG
     * @function
     * @param {String} of attribute to add.
     * @description
            This function adds one attributes for the search.
     */
    TargetNS.SearchAttributeAdd = function (Attribute) {
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

            // set autocomple to customer type fields
            $('#SearchInsert').find('.ITSMCustomerSearch').each(function(){
                var InputID = $(this).attr('id') + 'CustomerAutocomplete';
                $(this).removeClass('ITSMCustomerSearch');
                $(this).attr('id', InputID);
                $(this).prev().attr('id', InputID + 'Selected');
                ITSM.Agent.CustomerSearch.Init($('#' + Core.App.EscapeSelector(InputID)));

                // prevent dialog closure when select a customer from the list
                $('ul.ui-autocomplete').bind('click', function(Event){
                    Event.stopPropagation();
                    return false;
                });
            });

            // set autocomple to user type fields
            $('#SearchInsert').find('.ITSMUserSearch').each(function(){
                var InputID = $(this).attr('id') + 'UserAutocomplete';
                $(this).removeClass('ITSMUserSearch');
                $(this).attr('id', InputID);
                $(this).prev().attr('id', InputID + 'Selected');
                ITSM.Agent.UserSearch.Init($('#' + Core.App.EscapeSelector(InputID)));

                // prevent dialog closure when select a customer from the list
                $('ul.ui-autocomplete').bind('click', function(Event){
                    Event.stopPropagation();
                    return false;
                });
            });

            // Modernize fields
            Core.UI.InputFields.Activate($('#SearchInsert'));

            // Register event for tree selection dialog
            Core.UI.TreeSelection.InitTreeSelection();

            // Initially display dynamic fields with TreeMode = 1 correctly
            Core.UI.TreeSelection.InitDynamicFieldTreeViewRestore();
        }

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
            Action: 'AgentITSMChangeSearch',
            Subaction: 'AJAXProfileDelete',
            Profile: Profile
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
     * @return 0 if no values were found, 1 if values where there
     * @description Checks if any values were entered in the search.
     *              If nothing at all exists, it alerts with translated:
     *              "Please enter at least one search value or * to find anything"
     */
    function CheckForSearchedValues() {
        // loop through the SearchForm labels
        var SearchValueFlag = false;
        $('#SearchForm label').each(function () {
            var ElementName,
                $Element;

            // those with ID's are used for searching
            if ($(this).attr('id')) {
                    // substring "Label" (e.g. first five characters ) from the
                    // label id, use the remaining name as name string for accessing
                    // the form input's value
                    ElementName = $(this).attr('id').substring(5);
                    $Element = $('#SearchForm input[name=' + ElementName + ']');
                    // If there's no input element with the selected name
                    // find the next "select" element and use that one for checking
                    if (!$Element.length) {
                        $Element = $(this).next().find('select');
                    }
                    if ($Element.length) {
                        if ($Element.val() && $Element.val() !== '') {
                            SearchValueFlag = true;
                        }
                    }
            }
        });
        if (!SearchValueFlag) {
           alert(Core.Config.Get('EmptySearchMsg'));
        }
        return SearchValueFlag;
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
     * @param {String} Action which is used in framework right now.
     * @param {String} Used profile name.
     * @return nothing
     *      This function open the search dialog after clicking on "search" button in nav bar.
     */

    TargetNS.OpenSearchDialog = function (Action, Profile, EmptySearch) {

        var Referrer = Core.Config.Get('Action'),
            Data;

        if (!Action) {
            Action = 'AgentSearch';
        }

        Data = {
            Action: Action,
            Referrer: Referrer,
            Profile: Profile,
            EmptySearch: EmptySearch,
            Subaction: 'AJAX'
        };

        ShowWaitingDialog();

        Core.AJAX.FunctionCall(
            Core.Config.Get('CGIHandle'),
            Data,
            function (HTML) {
                // if the waiting dialog was cancelled, do not show the search
                //  dialog as well
                if (!$('.Dialog:visible').length) {
                    return;
                }

                Core.UI.Dialog.ShowContentDialog(HTML, Core.Config.Get('SearchMsg'), '10px', 'Center', true, undefined, true);

                // hide add template block
                $('#SearchProfileAddBlock').hide();

                // hide save changes in template block
                $('#SaveProfile').parent().hide().prev().hide().prev().hide();

                // search profile is selected
                if ($('#SearchProfile').val() && $('#SearchProfile').val() !== 'last-search') {

                    // show delete button
                    $('#SearchProfileDelete').show();

                    // show profile link
                    $('#SearchProfileAsLink').show();

                    // show save changes in template block
                    $('#SaveProfile').parent().show().prev().show().prev().show();

                    // set SaveProfile to 0
                    $('#SaveProfile').prop('checked', false);
                }

                Core.UI.InputFields.Activate($('.Dialog:visible'));

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
                        if (!CheckForSearchedValues()) {
                            return false;
                        }
                        else {
                            $('#SearchFormSubmit').trigger('click');
                        }
                        return false;
                    }
                });

                // register submit
                $('#SearchFormSubmit').bind('click', function () {
                    var ShownAttributes = '';

                    // remember shown attributes
                    $('#SearchInsert label').each(function () {
                        if ($(this).attr('id')) {
                            ShownAttributes = ShownAttributes + ';' + $(this).attr('id');
                        }
                    });
                    $('#SearchForm #ShownAttributes').val(ShownAttributes);

                    // Normal results mode will return HTML in the same window
                    if ($('#SearchForm #ResultForm').val() === 'Normal') {
                        if (!CheckForSearchedValues()) {
                            return false;
                        }
                        else {
                           $('#SearchForm').submit();
                           ShowWaitingDialog();
                        }
                    }
                    else { // Print and CSV should open in a new window, no waiting dialog
                        $('#SearchForm').attr('target', 'SearchResultPage');
                        if (!CheckForSearchedValues()) {
                            return false;
                        }
                        else {
                           $('#SearchForm').submit();
                           $('#SearchForm').attr('target', '');
                        }
                    }
                    return false;
                });

                // load profile
                $('#SearchProfile').bind('change', function () {
                    var Profile = $('#SearchProfile').val(),
                        EmptySearch = $('#EmptySearch').val(),
                        Action = $('#SearchAction').val();

                    TargetNS.OpenSearchDialog(Action, Profile, EmptySearch);
                    return false;
                });

                // show add profile block or not
                $('#SearchProfileNew').bind('click', function (Event) {
                    $('#SearchProfileAddBlock').toggle();
                    $('#SearchProfileAddName').focus();
                    Event.preventDefault();
                    return false;
                });

                // add new profile
                $('#SearchProfileAddAction').bind('click', function () {
                    var Name, $Element1;

                    // get name
                    Name = $('#SearchProfileAddName').val();
                    if (!Name) {
                        return false;
                    }

                    // add name to profile selection
                    $Element1 = $('#SearchProfile').children().first().clone();
                    $Element1.text(Name);
                    $Element1.attr('value', Name);
                    $Element1.prop('selected', true);
                    $('#SearchProfile').append($Element1);

                    // set input box to empty
                    $('#SearchProfileAddName').val('');

                    // hide add template block
                    $('#SearchProfileAddBlock').hide();

                    // hide save changes in template block
                    $('#SaveProfile').parent().hide().prev().hide().prev().hide();

                    // set SaveProfile to 1
                    $('#SaveProfile').prop('checked', true);

                    // show delete button
                    $('#SearchProfileDelete').show();

                    // show profile link
                    $('#SearchProfileAsLink').show();

                    return false;
                });

                // direct link to profile
                $('#SearchProfileAsLink').bind('click', function (Event) {
                    var Profile = $('#SearchProfile').val(),
                        Action = $('#SearchAction').val();

                    window.location.href = Core.Config.Get('Baselink') + 'Action=' + Action +
                    ';Subaction=Search;TakeLastSearch=1;SaveProfile=1;Profile=' + encodeURIComponent(Profile);
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

                            // show fulltext
                            TargetNS.SearchAttributeAdd('Fulltext');

                            // rebuild selection
                            TargetNS.AdditionalAttributeSelectionRebuild();
                        }
                    });

                    if ($('#SearchProfile').val() && $('#SearchProfile').val() === 'last-search') {

                        // hide delete link
                        $('#SearchProfileDelete').hide();

                        // hide profile link
                        $('#SearchProfileAsLink').hide();
                    }

                    Event.preventDefault();
                    return false;
                });

            }, 'html'
        );
    };

    return TargetNS;
}(ITSM.Agent.ChangeManagement.Search || {}));
