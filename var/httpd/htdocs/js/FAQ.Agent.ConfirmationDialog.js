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
 * @exports TargetNS as FAQ.Agent.ConfirmationDialog
 * @description
 *      This namespace contains the special module functions for ConfirmationDialog.
 */
FAQ.Agent.ConfirmationDialog = (function (TargetNS) {

    /**
     * @name DialogData
     * @memberof FAQ.Agent.ConfirmationDialog
     * @variable
     * @private
     * @description
     *      This variable stores the parameters that are passed from the DTL and contain all the data that the dialog needs.
     */
    var DialogData = [];

    /**
     * @name ShowWaitingDialog
     * @memberof FAQ.Agent.ConfirmationDialog
     * @function
     * @private
     * @param {String} PositionTop position of the dialog.
     * @description
     *      Shows waiting dialog until search screen is ready.
     */
    function ShowWaitingDialog(PositionTop){
        Core.UI.Dialog.ShowContentDialog('<div class="Spacing Center"><span class="AJAXLoader" title="' + Core.Config.Get('LoadingMsg') + '"></span></div>', '', PositionTop, 'Center', true);
    }

    /**
     * @name ShowConfirmationDialog
     * @memberof FAQ.Agent.ConfirmationDialog
     * @function
     * @returns {Boolean} false
     * @description
     *      This function shows a confirmation dialog with 2 buttons: Yes and No.
     */
    TargetNS.ShowConfirmationDialog = function () {

        var LocalDialogData,
            PositionTop,
            Data,
            Buttons;

        // get global saved DialogData for this function
        LocalDialogData = DialogData[$(this).attr('id')];

        // define the position of the dialog
        PositionTop = $(window).scrollTop() + ($(window).height() * 0.3);

        // show waiting dialog
        ShowWaitingDialog(PositionTop);

        // ajax call to the module that deletes the template
        Data = LocalDialogData.DialogContentQueryString;
        Core.AJAX.FunctionCall(Core.Config.Get('Baselink'), Data, function (Response) {

            // 'Confirmation' opens a dialog with 2 buttons: Yes and No
            if (Response.DialogType === 'Confirmation') {

                // define yes and no buttons
                Buttons = [{
                    Label: LocalDialogData.TranslatedText.Yes,
                    Class: "Primary",

                    // define the function that is called when the 'Yes' button is pressed
                    Function: function(){

                        // disable Yes and No buttons to prevent multiple submits
                        $('div.Dialog:visible div.ContentFooter button').attr('disabled', 'disabled');

                        // redirect to the module that does the confirmed action after pressing the Yes button
                        location.href = Core.Config.Get('Baselink') + LocalDialogData.ConfirmedActionQueryString;
                    }
                }, {
                    Label: LocalDialogData.TranslatedText.No,
                    Type: "Close"
                }];
            }

            // 'Message' opens a dialog with 1 button: Ok
            else if (Response.DialogType === 'Message') {

                // define Ok button
                Buttons = [{
                    Label: LocalDialogData.TranslatedText.Ok,
                    Class: "Primary",
                    Type: "Close"
                }];
            }

            // show the confirmation dialog to confirm the action
            Core.UI.Dialog.ShowContentDialog(Response.HTML, LocalDialogData.DialogTitle, PositionTop, "Center", true, Buttons);
        }, 'json');
        return false;
    };

    /**
     * @name BindConfirmationDialog
     * @memberof FAQ.Agent.ConfirmationDialog
     * @function
     * @param {Object} Data - The data that should be binded
     * @description
     *      This function binds a click event to the defined element
     */
    TargetNS.BindConfirmationDialog = function (Data) {
        DialogData[Data.ElementID] = Data;

        // binding a click event to the defined element
        $(DialogData[Data.ElementID].ElementSelector).bind('click', FAQ.Agent.ConfirmationDialog.ShowConfirmationDialog);
    };

    return TargetNS;
}(FAQ.Agent.ConfirmationDialog || {}));
