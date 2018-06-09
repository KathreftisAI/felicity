// --
// Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (AGPL). If you
// did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
// --

"use strict";

var Core = Core || {};

/**
 * @namespace Core.Form
 * @memberof Core
 * @author OTRS AG
 * @description
 *      This namespace contains all form functions.
 */
Core.Form = (function (TargetNS) {

    /*
     * check dependencies first
     */
    if (!Core.Debug.CheckDependency('Core.Form', 'Core.Data', 'Core.Data')) {
        return false;
    }

    /**
     * @name DisableForm
     * @memberof Core.Form
     * @function
     * @param {jQueryObject} $Form - All elements of this form will be disabled.
     * @description
     *      This function disables all elements of the given form. If no form given, it disables all form elements on the site.
     */
    TargetNS.DisableForm = function ($Form) {
        // If no form is given, disable all form elements on the complete site
        if (!isJQueryObject($Form)) {
            $Form = $('body');
        }

        // save action data to the given element
        if (!$Form.hasClass('AlreadyDisabled')) {
            $.each($Form.find("input:not([type='hidden']), textarea, select, button"), function () {
                var ReadonlyValue = $(this).attr('readonly'),
                    TagnameValue = $(this).prop('tagName'),
                    DisabledValue = $(this).attr('disabled');

                if (TagnameValue === 'BUTTON') {
                    Core.Data.Set($(this), 'OldDisabledStatus', DisabledValue);
                }
                else {
                    Core.Data.Set($(this), 'OldReadonlyStatus', ReadonlyValue);
                }
            });

            $Form
                .find("input:not([type='hidden']), textarea, select")
                .attr('readonly', 'readonly')
                .end()
                .find('button')
                .attr('disabled', 'disabled');

            // Add a speaking class to the form on DisableForm
            $Form.addClass('AlreadyDisabled');

            Core.App.Publish('Event.Form.DisableForm', [$Form]);
        }

    };

    /**
     * @name EnableForm
     * @memberof Core.Form
     * @function
     * @param {jQueryObject} $Form - All elements of this form will be enabled.
     * @description
     *      This function enables all elements of the given form. If no form given, it enables all form elements on the site.
     */
    TargetNS.EnableForm = function ($Form) {
        // If no form is given, enable all form elements on the complete site
        if (!isJQueryObject($Form)) {
            $Form = $('body');
        }

        $Form
            .find("input:not([type=hidden]), textarea, select")
            .removeAttr('readonly')
            .end()
            .find('button')
            .removeAttr('disabled');

        $.each($Form.find("input:not([type='hidden']), textarea, select, button"), function () {
            var TagnameValue = $(this).prop('tagName'),
                ReadonlyValue = Core.Data.Get($(this), 'OldReadonlyStatus'),
                DisabledValue = Core.Data.Get($(this), 'OldDisabledStatus');

            if (TagnameValue === 'BUTTON') {
                if (DisabledValue === 'disabled') {
                    $(this).attr('disabled', 'disabled');
                }
            }
            else {
                if (ReadonlyValue === 'readonly') {
                    $(this).attr('readonly', 'readonly');
                }
            }
        });

        // Remove the speaking class to the form on DisableForm
        $Form.removeClass('AlreadyDisabled');

        Core.App.Publish('Event.Form.EnableForm', [$Form]);
    };

    /**
     * @name SelectAllCheckboxes
     * @memberof Core.Form
     * @function
     * @param {jQueryObject} $ClickedBox - The clicked checkbox in the DOM.
     * @param {jQueryObject} $SelectAllCheckbox - The object with the SelectAll checkbox.
     * @description
     *      This function selects or deselects all checkboxes given by the ElementName.
     */
    TargetNS.SelectAllCheckboxes = function ($ClickedBox, $SelectAllCheckbox) {
        var ElementName, SelectAllID, $Elements,
            Status, CountCheckboxes, CountSelectedCheckboxes;

        if (isJQueryObject($ClickedBox, $SelectAllCheckbox)) {
            ElementName = $ClickedBox.attr('name');
            SelectAllID = $SelectAllCheckbox.attr('id');
            $Elements = $('input[type="checkbox"][name=' + ElementName + ']').filter('[id!=' + SelectAllID + ']:visible');
            Status = $ClickedBox.prop('checked');

            if ($ClickedBox.attr('id') && $ClickedBox.attr('id') === SelectAllID) {
                $Elements.prop('checked', Status).triggerHandler('click');
            }
            else {
                CountCheckboxes = $Elements.length;
                CountSelectedCheckboxes = $Elements.filter(':checked').length;
                if (CountCheckboxes === CountSelectedCheckboxes) {
                    $SelectAllCheckbox.prop('checked', true);
                }
                else {
                    $SelectAllCheckbox.prop('checked', false);
                }
            }
        }
    };

    /**
     * @name InitSelectAllCheckboxes
     * @memberof Core.Form
     * @function
     * @param {jQueryObject} $Checkboxes - The jquery object with all dependent checkboxes.
     * @param {jQueryObject} $SelectAllCheckbox - The object with the SelectAll checkbox.
     * @description
     *      This function marks the "SelectAll checkbox" as checked if all depending checkboxes are already marked checked.
     *      Adds PubSub event to control handling of checkboxes, if a filter is used.
     */
    TargetNS.InitSelectAllCheckboxes = function ($Checkboxes, $SelectAllCheckbox) {
        if (isJQueryObject($Checkboxes, $SelectAllCheckbox)) {
            // Mark SelectAll checkbox if all depending checkboxes are already marked on initialization
            if ($Checkboxes.filter(':checked').length && ($Checkboxes.filter('[id!=' + $SelectAllCheckbox.attr('id') + ']').length === $Checkboxes.filter(':checked').length)) {
                $SelectAllCheckbox.prop('checked', true);
            }

            // Adjust  checkbox selection, if filter is used/changed
            Core.App.Subscribe('Event.UI.Table.InitTableFilter.Change', function ($FilterInput, $Container) {

                var CountCheckboxesVisible = $Checkboxes.filter('[id!=' + $SelectAllCheckbox.attr('id') + ']:visible');

                // Only continue, if the filter event is associated with the container we are working in
                if (!$.contains($Container[0], $SelectAllCheckbox[0])) {
                    return;
                }

                if (CountCheckboxesVisible.length && (CountCheckboxesVisible.filter(':checked').length === CountCheckboxesVisible.length)) {
                    $SelectAllCheckbox.prop('checked', true);
                }
                else {
                    $SelectAllCheckbox.prop('checked', false);
                }
            });
        }
    };

    return TargetNS;
}(Core.Form || {}));
