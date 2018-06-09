// --
// Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (AGPL). If you
// did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
// --

"use strict";

var Core = Core || {};
Core.Agent = Core.Agent || {};

/**
 * @namespace Core.Agent.CustomerSearch
 * @memberof Core.Agent
 * @author OTRS AG
 * @description
 *      This namespace contains the special module functions for the customer search.
 */
Core.Agent.CustomerSearch = (function (TargetNS) {
    /**
     * @private
     * @name BackupData
     * @memberof Core.Agent.CustomerSearch
     * @member {Object}
     * @description
     *      Saves Customer data for later restore.
     */
    var BackupData = {
            CustomerInfo: '',
            CustomerEmail: '',
            CustomerKey: ''
        },
    /**
     * @private
     * @name CustomerFieldChangeRunCount
     * @memberof Core.Agent.CustomerSearch
     * @member {Object}
     * @description
     *      Needed for the change event of customer fields, if ActiveAutoComplete is false (disabled).
     */
        CustomerFieldChangeRunCount = {};

    /**
     * @private
     * @name GetCustomerInfo
     * @memberof Core.Agent.CustomerSearch
     * @function
     * @param {String} CustomerUserID
     * @description
     *      This function gets customer data for customer info table.
     */
    function GetCustomerInfo(CustomerUserID) {
        var Data = {
            Action: 'AgentCustomerSearch',
            Subaction: 'CustomerInfo',
            CustomerUserID: CustomerUserID
        };
        Core.AJAX.FunctionCall(Core.Config.Get('Baselink'), Data, function (Response) {
            // set CustomerID
            $('#CustomerID').val(Response.CustomerID);
            $('#ShowCustomerID').html(Response.CustomerID);

            // Publish information for subscribers
            Core.App.Publish('Event.Agent.CustomerSearch.GetCustomerInfo.Callback', [Response.CustomerID]);

            // show customer info
            $('#CustomerInfo .Content').html(Response.CustomerTableHTMLString);

            // only execute this part, if in AgentTicketEmail or AgentTicketPhone
            if (Core.Config.Get('Action') === 'AgentTicketEmail' || Core.Config.Get('Action') === 'AgentTicketPhone') {
                // reset service
                $('#ServiceID').attr('selectedIndex', 0);
                // update services (trigger ServiceID change event)
                Core.AJAX.FormUpdate($('#CustomerID').closest('form'), 'AJAXUpdate', 'ServiceID', ['Dest', 'SelectedCustomerUser', 'NextStateID', 'PriorityID', 'ServiceID', 'SLAID', 'CryptKeyID', 'OwnerAll', 'ResponsibleAll', 'TicketFreeText1', 'TicketFreeText2', 'TicketFreeText3', 'TicketFreeText4', 'TicketFreeText5', 'TicketFreeText6', 'TicketFreeText7', 'TicketFreeText8', 'TicketFreeText9', 'TicketFreeText10', 'TicketFreeText11', 'TicketFreeText12', 'TicketFreeText13', 'TicketFreeText14', 'TicketFreeText15', 'TicketFreeText16']);
            }
            if (Core.Config.Get('Action') === 'AgentTicketProcess'){
                // reset service
                $('#ServiceID').attr('selectedIndex', 0);
                // update services (trigger ServiceID change event)
                Core.AJAX.FormUpdate($('#CustomerID').closest('form'), 'AJAXUpdate', 'ServiceID', Core.Config.Get('ProcessManagement.UpdatableFields'));
            }
        });
    }

    /**
     * @private
     * @name GetCustomerTickets
     * @memberof Core.Agent.CustomerSearch
     * @function
     * @param {String} CustomerUserID
     * @param {String} CustomerID
     * @description
     *      This function gets customer tickets.
     */
    function GetCustomerTickets(CustomerUserID, CustomerID) {

        var Data = {
            Action: 'AgentCustomerSearch',
            Subaction: 'CustomerTickets',
            CustomerUserID: CustomerUserID,
            CustomerID: CustomerID
        };

        // check if customer tickets should be shown
        if (!parseInt(Core.Config.Get('CustomerSearch.ShowCustomerTickets'), 10)) {
            return;
        }

        /**
         * @private
         * @name CustomerHistoryEvents
         * @memberof Core.Agent.CustomerSearch.GetCustomerTickets
         * @function
         * @description
         *      This function creates events for Customer History overview table.
         */
        function CustomerHistoryEvents() {
            $('select[name=ResponseID]').on('change', function () {
                var URL;
                if ($(this).val() > 0) {
                    URL = Core.Config.Get('Baselink') + $(this).parents().serialize();
                    Core.UI.Popup.OpenPopup(URL, 'TicketAction');

                    // Reset the select box so that it can be used again from the same window.
                    $(this).val('0');
                }
            });
            $('select[name=ResponseID]').on('click', function (Event) {
                Event.stopPropagation();
                return false;
            });

            $('#CustomerTickets .MasterAction').on('click', function (Event) {
                var $MasterActionLink = $(this).find('a.MasterActionLink');

                // Prevent MasterAction on Modernize input fields.
                if ($(Event.target).hasClass('InputField_Search')) {
                    return true;
                }

                // Event must be done in the parent window because AgentTicketCustomer is in popup.
                if (Core.Config.Get('Action') === 'AgentTicketCustomer') {
                    Core.UI.Popup.ExecuteInParentWindow(function(WindowObject) {
                        WindowObject.Core.UI.Popup.FirePopupEvent('URL', { URL: $MasterActionLink.attr('href') });
                    });
                    Core.UI.Popup.ClosePopup();
                    return false;
                }
                else {

                    // Only act if the link was not clicked directly.
                    if (Event.target !== $MasterActionLink.get(0)) {
                        window.location = $MasterActionLink.attr('href');
                        return false;
                    }
                }
            });

            $("#SortBy").off('change').on('change', function () {
                var SortedData,
                    Selection = $(this).val().split('|');

                if (Selection.length === 2) {

                    // Show sorted customer tickets.
                    SortedData = {
                        Action: 'AgentCustomerSearch',
                        Subaction: 'CustomerTickets',
                        CustomerUserID: CustomerUserID,
                        CustomerID: CustomerID,
                        SortBy: Selection[0],
                        OrderBy: Selection[1]
                    };
                    Core.AJAX.FunctionCall(Core.Config.Get('Baselink'), SortedData, function (Response) {
                        if ($('#CustomerTickets').length) {
                            $('#CustomerTickets').html(Response.CustomerTicketsHTMLString);
                            ReplaceCustomerTicketLinks();
                        }
                    });
                }
            });

            // Activate Modernize fields.
            Core.UI.InputFields.Activate();
        }

        /**
         * @private
         * @name ReplaceCustomerTicketLinks
         * @memberof Core.Agent.CustomerSearch.GetCustomerTickets
         * @function
         * @returns {Boolean} Returns false.
         * @description
         *      This function replaces and shows customer ticket links.
         */
        function ReplaceCustomerTicketLinks() {
            $('#CustomerTickets').find('.AriaRoleMain').removeAttr('role').removeClass('AriaRoleMain');

            // Replace overview mode links (S, M, L view), pagination links with AJAX
            $('#CustomerTickets').find('.OverviewZoom a, .Pagination a, .TableSmall th a').click(function () {
                // Cut out BaseURL and query string from the URL
                var Link = $(this).attr('href'),
                    URLComponents;

                URLComponents = Link.split('?', 2);

                Core.AJAX.FunctionCall(URLComponents[0], URLComponents[1], function (Response) {
                    // show customer tickets
                    if ($('#CustomerTickets').length) {
                        $('#CustomerTickets').html(Response.CustomerTicketsHTMLString);
                        ReplaceCustomerTicketLinks();
                    }
                });
                return false;
            });

            // Init accordion of overview article preview
            Core.UI.Accordion.Init($('.Preview > ul'), 'li h3 a', '.HiddenBlock');

            // Events for Customer History table - AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer screens.
            if (
                Core.Config.Get('Action') === 'AgentTicketPhone' ||
                Core.Config.Get('Action') === 'AgentTicketEmail' ||
                Core.Config.Get('Action') === 'AgentTicketCustomer'
                )
            {
                CustomerHistoryEvents();
            }
            return false;
        }

        Core.AJAX.FunctionCall(Core.Config.Get('Baselink'), Data, function (Response) {
            // show customer tickets
            if ($('#CustomerTickets').length) {
                $('#CustomerTickets').html(Response.CustomerTicketsHTMLString);
                ReplaceCustomerTicketLinks();
            }
        });
    }

    /**
     * @private
     * @name CheckPhoneCustomerCountLimit
     * @memberof Core.Agent.CustomerSearch
     * @function
     * @description
     *      In AgentTicketPhone, this checks if more than one entry is allowed
     *      in the customer list and blocks/unblocks the autocomplete field as needed.
     */
    function CheckPhoneCustomerCountLimit() {

        // Only operate in AgentTicketPhone
        if (Core.Config.Get('Action') !== 'AgentTicketPhone') {
            return;
        }

        // Check if multiple from entries are allowed
        if (Core.Config.Get('Ticket::Frontend::AgentTicketPhone::AllowMultipleFrom') === "1") {
            return;
        }

        if ($('#TicketCustomerContentFromCustomer input.CustomerTicketText').length > 0) {
            $('#FromCustomer').val('').prop('disabled', true).prop('readonly', true);
            $('#Dest').trigger('focus');
        }
        else {
            $('#FromCustomer').val('').prop('disabled', false).prop('readonly', false);
        }
    }

    /**
     * @private
     * @name Init
     * @memberof Core.Agent.CustomerSearch
     * @function
     * @param {jQueryObject} $Element - The jQuery object of the input field with autocomplete.
     * @description
     *      Initializes the module.
     */
    TargetNS.Init = function ($Element) {
        // get customer tickets for AgentTicketCustomer
        if (Core.Config.Get('Action') === 'AgentTicketCustomer') {
            GetCustomerTickets($('#CustomerAutoComplete').val(), $('#CustomerID').val());

            $Element.blur(function () {
                if ($Element.val() === '') {
                    TargetNS.ResetCustomerInfo();
                    $('#CustomerTickets').empty();
                }
            });
        }

        // get customer tickets for AgentTicketPhone and AgentTicketEmail
        if ((Core.Config.Get('Action') === 'AgentTicketEmail' || Core.Config.Get('Action') === 'AgentTicketPhone') && $('#SelectedCustomerUser').val() !== '') {
            GetCustomerTickets($('#SelectedCustomerUser').val());
        }

        // just save the initial state of the customer info
        if ($('#CustomerInfo').length) {
            BackupData.CustomerInfo = $('#CustomerInfo .Content').html();
        }

        if (isJQueryObject($Element)) {
            // Hide tooltip in autocomplete field, if user already typed something to prevent the autocomplete list
            // to be hidden under the tooltip. (Only needed for serverside errors)
            $Element.unbind('keyup.Validate').bind('keyup.Validate', function () {
               var Value = $Element.val();
               if ($Element.hasClass('ServerError') && Value.length) {
                   $('#OTRS_UI_Tooltips_ErrorTooltip').hide();
               }
            });

            Core.UI.Autocomplete.Init($Element, function (Request, Response) {
                var URL = Core.Config.Get('Baselink'),
                    Data = {
                        Action: 'AgentCustomerSearch',
                        Term: Request.term,
                        MaxResults: Core.UI.Autocomplete.GetConfig('MaxResultsDisplayed')
                    };

                $Element.data('AutoCompleteXHR', Core.AJAX.FunctionCall(URL, Data, function (Result) {
                    var ValueData = [];
                    $Element.removeData('AutoCompleteXHR');
                    $.each(Result, function () {
                        ValueData.push({
                            label: this.CustomerValue + " (" + this.CustomerKey + ")",
                            // customer list representation (see CustomerUserListFields from Defaults.pm)
                            value: this.CustomerValue,
                            // customer user id
                            key: this.CustomerKey
                        });
                    });
                    Response(ValueData);
                }));
            }, function (Event, UI) {
                var CustomerKey = UI.item.key,
                    CustomerValue = UI.item.value;

                BackupData.CustomerKey = CustomerKey;
                BackupData.CustomerEmail = CustomerValue;

                if (Core.Config.Get('Action') === 'AgentBook') {
                    $(Event.target).val(CustomerValue);
                    return false;
                }

                $Element.val(CustomerValue);

                if (Core.Config.Get('Action') === 'AgentTicketEmail' || Core.Config.Get('Action') === 'AgentTicketCompose' || Core.Config.Get('Action') === 'AgentTicketForward' || Core.Config.Get('Action') === 'AgentTicketEmailOutbound') {
                    $Element.val('');
                }

                if (Core.Config.Get('Action') !== 'AgentTicketPhone' && Core.Config.Get('Action') !== 'AgentTicketEmail' && Core.Config.Get('Action') !== 'AgentTicketCompose' && Core.Config.Get('Action') !== 'AgentTicketForward' && Core.Config.Get('Action') !== 'AgentTicketEmailOutbound') {
                    // set hidden field SelectedCustomerUser
                    $('#SelectedCustomerUser').val(CustomerKey);

                    // needed for AgentTicketCustomer.pm
                    if ($('#CustomerUserID').length) {
                        $('#CustomerUserID').val(CustomerKey);
                        if ($('#CustomerUserOption').length) {
                            $('#CustomerUserOption').val(CustomerKey);
                        }
                        else {
                            $('<input type="hidden" name="CustomerUserOption" id="CustomerUserOption">').val(CustomerKey).appendTo($Element.closest('form'));
                        }
                    }

                    // get customer tickets
                    GetCustomerTickets(CustomerKey);

                    // get customer data for customer info table
                    GetCustomerInfo(CustomerKey);
                }
                else {
                    TargetNS.AddTicketCustomer($(Event.target).attr('id'), CustomerValue, CustomerKey);
                }
            }, 'CustomerSearch');

            if (
                Core.Config.Get('Action') !== 'AgentTicketCustomer' &&
                Core.Config.Get('Action') !== 'AgentTicketPhone' &&
                Core.Config.Get('Action') !== 'AgentTicketEmail' &&
                Core.Config.Get('Action') !== 'AgentTicketCompose' &&
                Core.Config.Get('Action') !== 'AgentTicketForward' &&
                Core.Config.Get('Action') !== 'AgentTicketEmailOutbound'
                ) {
                $Element.blur(function () {
                    var FieldValue = $(this).val();
                    if (FieldValue !== BackupData.CustomerEmail && FieldValue !== BackupData.CustomerKey) {
                        $('#SelectedCustomerUser').val('');
                        $('#CustomerUserID').val('');
                        $('#CustomerID').val('');
                        $('#CustomerUserOption').val('');
                        $('#ShowCustomerID').html('');

                        // reset customer info table
                        $('#CustomerInfo .Content').html(BackupData.CustomerInfo);

                        if (Core.Config.Get('Action') === 'AgentTicketProcess'){
                            // update services (trigger ServiceID change event)
                            Core.AJAX.FormUpdate($('#CustomerID').closest('form'), 'AJAXUpdate', 'ServiceID', Core.Config.Get('ProcessManagement.UpdatableFields'));
                        }
                    }
                });
            }
            else {
                // initializes the customer fields
                TargetNS.InitCustomerField();
            }
        }

        // On unload remove old selected data. If the page is reloaded (with F5) this data
        // stays in the field and invokes an ajax request otherwise. We need to use beforeunload
        // here instead of unload because the URL of the window does not change on reload which
        // doesn't trigger pagehide.
        $(window).bind('beforeunload.CustomerSearch', function () {
            $('#SelectedCustomerUser').val('');
            return; // return nothing to suppress the confirmation message
        });

        CheckPhoneCustomerCountLimit();
    };

    function htmlDecode(Text){
        return Text.replace(/&amp;/g, '&');
    }

    /**
     * @name AddTicketCustomer
     * @memberof Core.Agent.CustomerSearch
     * @function
     * @returns {Boolean} Returns false.
     * @param {String} Field
     * @param {String} CustomerValue - The readable customer identifier.
     * @param {String} CustomerKey - Customer key on system.
     * @param {String} SetAsTicketCustomer -  Set this customer as main ticket customer.
     * @description
     *      This function adds a new ticket customer
     */
    TargetNS.AddTicketCustomer = function (Field, CustomerValue, CustomerKey, SetAsTicketCustomer) {

        var $Clone = $('.CustomerTicketTemplate' + Field).clone(),
            CustomerTicketCounter = $('#CustomerTicketCounter' + Field).val(),
            TicketCustomerIDs = 0,
            IsDuplicated = false,
            Suffix;

        if (typeof CustomerKey !== 'undefined') {
            CustomerKey = htmlDecode(CustomerKey);
        }

        if (CustomerValue === '') {
            return false;
        }

        // check for duplicated entries
        $('[class*=CustomerTicketText]').each(function() {
            if ($(this).val() === CustomerValue) {
                IsDuplicated = true;
            }
        });
        if (IsDuplicated) {
            TargetNS.ShowDuplicatedDialog(Field);
            return false;
        }

        // get number of how much customer ticket are present
        TicketCustomerIDs = $('.CustomerContainer input[type="radio"]').length;

        // increment customer counter
        CustomerTicketCounter++;

        // set sufix
        Suffix = '_' + CustomerTicketCounter;

        // remove unnecessary classes
        $Clone.removeClass('Hidden CustomerTicketTemplate' + Field);

        // copy values and change ids and names
        $Clone.find(':input, a').each(function(){
            var ID = $(this).attr('id');
            $(this).attr('id', ID + Suffix);
            $(this).val(CustomerValue);
            if (ID !== 'CustomerSelected') {
                $(this).attr('name', ID + Suffix);
            }

            // add event handler to radio button
            if($(this).hasClass('CustomerTicketRadio')) {

                if (TicketCustomerIDs === 0) {
                    $(this).prop('checked', true);
                }

                // set counter as value
                $(this).val(CustomerTicketCounter);

                // bind change function to radio button to select customer
                $(this).bind('change', function () {
                    // remove row
                    if ($(this).prop('checked')){
                        TargetNS.ReloadCustomerInfo(CustomerKey);
                    }
                    return false;
                });
            }

            // set customer key if present
            if($(this).hasClass('CustomerKey')) {
                $(this).val(CustomerKey);
            }

            // add event handler to remove button
            if($(this).hasClass('RemoveButton')) {

                // bind click function to remove button
                $(this).bind('click', function () {

                    // remove row
                    TargetNS.RemoveCustomerTicket($(this));

                    // clear CustomerHistory table if there are no selected customer users
                    if ($('#TicketCustomerContent' + Field + ' .CustomerTicketRadio').length === 0) {
                        $('#CustomerTickets').empty();
                    }
                    return false;
                });
                // set button value
                $(this).val(CustomerValue);
            }

        });
        // show container
        $('#TicketCustomerContent' + Field).parent().removeClass('Hidden');
        // append to container
        $('#TicketCustomerContent' + Field).append($Clone);

        // set new value for CustomerTicketCounter
        $('#CustomerTicketCounter' + Field).val(CustomerTicketCounter);
        if ((CustomerKey !== '' && TicketCustomerIDs === 0 && (Field === 'ToCustomer' || Field === 'FromCustomer')) || SetAsTicketCustomer) {
            if (SetAsTicketCustomer) {
                $('#CustomerSelected_' + CustomerTicketCounter).prop('checked', true).trigger('change');
            }
            else {
                $('.CustomerContainer input[type="radio"]:first').prop('checked', true).trigger('change');
            }
        }

        // return value to search field
        $('#' + Field).val('').focus();

        CheckPhoneCustomerCountLimit();

        // reload Crypt options on AgentTicketEMail, AgentTicketCompose and AgentTicketForward
        if ((Core.Config.Get('Action') === 'AgentTicketEmail' || Core.Config.Get('Action') === 'AgentTicketCompose' || Core.Config.Get('Action') === 'AgentTicketForward' || Core.Config.Get('Action') === 'AgentTicketEmailOutbound') && $('#CryptKeyID').length) {
            Core.AJAX.FormUpdate($('#' + Field).closest('form'), 'AJAXUpdate', '', ['CryptKeyID']);
        }

        // now that we know that at least one customer has been added,
        // we can remove eventual errors from the customer field
        $('#FromCustomer, #ToCustomer')
            .removeClass('Error ServerError')
            .closest('.Field')
            .prev('label')
            .removeClass('LabelError');
        Core.Form.ErrorTooltips.HideTooltip();

        return false;
    };

    /**
     * @name RemoveCustomerTicket
     * @memberof Core.Agent.CustomerSearch
     * @function
     * @param {jQueryObject} Object - JQuery object used as base to delete it's parent.
     * @description
     *      This function removes a customer ticket entry.
     */
    TargetNS.RemoveCustomerTicket = function (Object) {
        var TicketCustomerIDs = 0,
        $Field = Object.closest('.Field'),
        $Form;

        if (Core.Config.Get('Action') === 'AgentTicketEmail' || Core.Config.Get('Action') === 'AgentTicketCompose' || Core.Config.Get('Action') === 'AgentTicketForward' || Core.Config.Get('Action') === 'AgentTicketEmailOutbound') {
            $Form = Object.closest('form');
        }
        Object.parent().remove();
        TicketCustomerIDs = $('.CustomerContainer input[type="radio"]').length;
        if (TicketCustomerIDs === 0) {
            TargetNS.ResetCustomerInfo();
        }

        // reload Crypt options on AgentTicketEMail, AgentTicketCompose and AgentTicketForward
        if ((Core.Config.Get('Action') === 'AgentTicketEmail' || Core.Config.Get('Action') === 'AgentTicketCompose' || Core.Config.Get('Action') === 'AgentTicketForward' || Core.Config.Get('Action') === 'AgentTicketEmailOutbound') && $('#CryptKeyID').length) {
            Core.AJAX.FormUpdate($Form, 'AJAXUpdate', '', ['CryptKeyID']);
        }

        if(!$('.CustomerContainer input[type="radio"]').is(':checked')){
            //set the first one as checked
            $('.CustomerContainer input[type="radio"]:first').prop('checked', true).trigger('change');
        }

        if ($Field.find('.CustomerTicketText:visible').length === 0) {
            $Field.addClass('Hidden');
        }

        CheckPhoneCustomerCountLimit();
    };

    /**
     * @name ResetCustomerInfo
     * @memberof Core.Agent.CustomerSearch
     * @function
     * @description
     *      This function clears all selected customer info.
     */
    TargetNS.ResetCustomerInfo = function () {
            $('#SelectedCustomerUser').val('');
            $('#CustomerUserID').val('');
            $('#CustomerID').val('');
            $('#CustomerUserOption').val('');
            $('#ShowCustomerID').html('');

            // reset customer info table
            $('#CustomerInfo .Content').html(Core.Config.Get('TextNone'));
    };

    /**
     * @name ReloadCustomerInfo
     * @memberof Core.Agent.CustomerSearch
     * @function
     * @param {String} CustomerKey
     * @description
     *      This function reloads info for selected customer.
     */
    TargetNS.ReloadCustomerInfo = function (CustomerKey) {

        // get customer tickets
        GetCustomerTickets(CustomerKey);

        // get customer data for customer info table
        GetCustomerInfo(CustomerKey);

        // set hidden field SelectedCustomerUser
        $('#SelectedCustomerUser').val(CustomerKey);
    };

    /**
     * @name InitCustomerField
     * @memberof Core.Agent.CustomerSearch
     * @function
     * @description
     *      This function initializes the customer fields.
     */
    TargetNS.InitCustomerField = function () {

        // loop over the field with CustomerAutoComplete class
        $('.CustomerAutoComplete').each(function() {
            var ObjectId = $(this).attr('id');

            $('#' + ObjectId).bind('change', function () {

                if (!$('#' + ObjectId).val() || $('#' + ObjectId).val() === '') {
                    return false;
                }

                // if autocompletion is disabled and only avaible via the click
                // of a button next to the input field, we cannot handle this
                // change event the normal way.
                if (!Core.UI.Autocomplete.GetConfig('ActiveAutoComplete')) {
                    // we wait some time after this event to check, if the search button
                    // for this field was pressed. If so, no action is needed
                    // If the change event was fired without clicking the search button,
                    // probably the user clicked out of the field.
                    // This should also add the customer (the enetered value) to the list

                    if (typeof CustomerFieldChangeRunCount[ObjectId] === 'undefined') {
                        CustomerFieldChangeRunCount[ObjectId] = 1;
                    }
                    else {
                        CustomerFieldChangeRunCount[ObjectId]++;
                    }

                    if (Core.UI.Autocomplete.SearchButtonClicked[ObjectId]) {
                        delete CustomerFieldChangeRunCount[ObjectId];
                        delete Core.UI.Autocomplete.SearchButtonClicked[ObjectId];
                        return false;
                    }
                    else {
                        if (CustomerFieldChangeRunCount[ObjectId] === 1) {
                            window.setTimeout(function () {
                                $('#' + ObjectId).trigger('change');
                            }, 200);
                            return false;
                        }
                        delete CustomerFieldChangeRunCount[ObjectId];
                    }
                }


                // If the autocomplete popup window is visible, delay this change event.
                // It might be caused by clicking with the mouse into the autocomplete list.
                // Wait until it is closed to be sure that we don't add a customer twice.

                if ($(this).autocomplete("widget").is(':visible')) {
                    window.setTimeout(function(){
                        $('#' + ObjectId).trigger('change');
                    }, 200);
                    return false;
                }

                Core.Agent.CustomerSearch.AddTicketCustomer(ObjectId, $('#' + ObjectId).val());
                return false;
            });

            $('#' + ObjectId).bind('keypress', function (e) {
                if (e.which === 13){
                    Core.Agent.CustomerSearch.AddTicketCustomer(ObjectId, $('#' + ObjectId).val());
                    return false;
                }
            });
        });
    };

    /**
     * @name ShowDuplicatedDialog
     * @memberof Core.Agent.CustomerSearch
     * @function
     * @param {String} Field - ID object of the element should receive the focus on close event.
     * @description
     *      This function shows an alert dialog for duplicated entries.
     */
    TargetNS.ShowDuplicatedDialog = function(Field){
        Core.UI.Dialog.ShowAlert(
            Core.Config.Get('Duplicated.TitleText'),
            Core.Config.Get('Duplicated.ContentText') + ' ' + Core.Config.Get('Duplicated.RemoveText'),
            function () {
                Core.UI.Dialog.CloseDialog($('.Alert'));
                $('#' + Field).val('');
                $('#' + Field).focus();
                return false;
            }
        );
    };

    return TargetNS;
}(Core.Agent.CustomerSearch || {}));
