// --
// Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (AGPL). If you
// did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
// --

"use strict";

var Core = Core || {};
Core.UI = Core.UI || {};

/**
 * @namespace Core.UI.RichTextEditor
 * @memberof Core.UI
 * @author OTRS AG
 * @description
 *      Richtext Editor.
 */
Core.UI.RichTextEditor = (function (TargetNS) {
    /**
     * @private
     * @name $FormID
     * @memberof Core.UI.RichTextEditor
     * @member {jQueryObject}
     * @description
     *      Hidden input field with name FormID.
     */
    var $FormID,

    /**
     * @private
     * @name TimeOutRTEOnChange
     * @memberof Core.UI.RichTextEditor
     * @member {Object}
     * @description
     *      Object to handle timeout.
     */
        TimeOutRTEOnChange;

    /**
     * @private
     * @name CheckFormID
     * @memberof Core.UI.RichTextEditor
     * @function
     * @returns {jQueryObject} FormID element.
     * @param {jQueryObject} $EditorArea - The jQuery object of the element that has become a rich text editor.
     * @description
     *      Check in the window which hidden element has a name same to 'FormID' and return it like a JQuery object.
     */
    function CheckFormID($EditorArea) {
        if (typeof $FormID === 'undefined') {
            $FormID = $EditorArea.closest('form').find('input:hidden[name=FormID]');
        }
        return $FormID;
    }

    /**
     * @name Init
     * @memberof Core.UI.RichTextEditor
     * @function
     * @returns {Boolean} Returns false on error.
     * @param {jQueryObject} $EditorArea - The jQuery object of the element that will be a rich text editor.
     * @description
     *      This function initializes the application and executes the needed functions.
     */
    TargetNS.Init = function ($EditorArea) {
        var EditorID = '',
            Editor,
            UserLanguage,
            UploadURL = '';

        if (isJQueryObject($EditorArea) && $EditorArea.hasClass('HasCKEInstance')) {
            return false;
        }

        if (isJQueryObject($EditorArea) && $EditorArea.length === 1) {
            EditorID = $EditorArea.attr('id');
        }

        if (EditorID === '') {
            Core.Exception.Throw('RichTextEditor: Need exactly one EditorArea!', 'TypeError');
        }

        // mark the editor textarea as linked with an RTE instance to avoid multiple instances
        $EditorArea.addClass('HasCKEInstance');

        CKEDITOR.on('instanceCreated', function (Editor) {
            CKEDITOR.addCss(Core.Config.Get('RichText.EditingAreaCSS'));

            // Remove the validation error tooltip if content is added to the editor
            Editor.editor.on('change', function() {
                window.clearTimeout(TimeOutRTEOnChange);
                TimeOutRTEOnChange = window.setTimeout(function () {
                    Core.Form.Validate.ValidateElement($(Editor.editor.element.$));
                }, 250);
            });

            // if spell checker is used on paste new content should spell check again
            Editor.editor.on('paste', function() {
                Core.Config.Set('TextIsSpellChecked', false);
            });
            // if spell checker is used on any key new content should spell check again
            Editor.editor.on('key', function() {
                Core.Config.Set('TextIsSpellChecked', false);
            });

            Core.App.Publish('Event.UI.RichTextEditor.InstanceCreated', [Editor]);
        });

        CKEDITOR.on('instanceReady', function (Editor) {
            Core.App.Publish('Event.UI.RichTextEditor.InstanceReady', [Editor]);
        });

        // The format for the language is different between OTRS and CKEditor (see bug#8024)
        // To correct this, we replace "_" with "-" in the language (e.g. zh_CN becomes zh-cn)
        UserLanguage = Core.Config.Get('UserLanguage').replace(/_/, "-");

        // build URL for image upload
        if (CheckFormID($EditorArea).length) {

            UploadURL = Core.Config.Get('Baselink')
                    + 'Action='
                    + Core.Config.Get('RichText.PictureUploadAction', 'PictureUpload')
                    + '&FormID='
                    + CheckFormID($EditorArea).val()
                    + '&' + Core.Config.Get('SessionName')
                    + '=' + Core.Config.Get('SessionID');
        }

        /*eslint-disable camelcase */
        Editor = CKEDITOR.replace(EditorID,
        {
            customConfig: '', // avoid loading external config files
            defaultLanguage: UserLanguage,
            language: UserLanguage,
            width: Core.Config.Get('RichText.Width', 620),
            resize_minWidth: Core.Config.Get('RichText.Width', 620),
            height: Core.Config.Get('RichText.Height', 320),
            removePlugins: CheckFormID($EditorArea).length ? '' : 'image2,uploadimage',
            forcePasteAsPlainText: false,
            format_tags: 'p;h1;h2;h3;h4;h5;h6;pre',
            fontSize_sizes: '8px;10px;12px;16px;18px;20px;22px;24px;26px;28px;30px;',
            extraAllowedContent: 'div[type]{*}; img[*]; col[width]; style[*]{*}; *[id](*)',
            enterMode: CKEDITOR.ENTER_BR,
            shiftEnterMode: CKEDITOR.ENTER_BR,
            contentsLangDirection: Core.Config.Get('RichText.TextDir', 'ltr'),
            disableNativeSpellChecker: false,
            toolbar: CheckFormID($EditorArea).length ? Core.Config.Get('RichText.Toolbar') : Core.Config.Get('RichText.ToolbarWithoutImage'),
            filebrowserBrowseUrl: '',
            filebrowserUploadUrl: UploadURL,
            extraPlugins: Core.Config.Get('RichText.SpellChecker') ? 'aspell,splitquote,contextmenu_linkopen,preventimagepaste' : 'splitquote,contextmenu_linkopen,preventimagepaste',
            entities: false,
            skin: 'bootstrapck'
        });
        /*eslint-enable camelcase */

        CKEDITOR.config.spellerPagesServerScript = Core.Config.Get('Baselink');

        // check if creating CKEditor was successful
        // might be a problem on mobile devices e.g.
        if (typeof Editor !== 'undefined') {
            // Hack for updating the textarea with the RTE content (bug#5857)
            // Rename the original function to another name, than overwrite the original one
            CKEDITOR.instances[EditorID].updateElementOriginal = CKEDITOR.instances[EditorID].updateElement;
            CKEDITOR.instances[EditorID].updateElement = function() {
                var Data;

                // First call the original function
                CKEDITOR.instances[EditorID].updateElementOriginal();

                // Now check if there is actually any non-whitespace content in the
                //  textarea field. If not, set it to an empty value to make sure
                //  the server side validation works correctly and there is no trash
                //  like '<br/>' stored in the DB.
                Data = this.element.getValue(); // get textarea content

                // only if data contains no image tag,
                // this is important for inline images, we don't want to remove them!
                if (!Data.match(/<img/)) {
                    // remove tags and whitespace for checking
                    Data = Data.replace(/\s+|&nbsp;|<\/?\w+[^>]*\/?>/g, '');
                    if (!Data.length) {
                        this.element.setValue(''); // reset textarea
                    }
                }
            };

            // Needed for clientside validation of RTE
            CKEDITOR.instances[EditorID].on('blur', function () {
                CKEDITOR.instances[EditorID].updateElement();
                Core.Form.Validate.ValidateElement($EditorArea);
            });

            // needed for client-side validation
            CKEDITOR.instances[EditorID].on('focus', function () {

                Core.App.Publish('Event.UI.RichTextEditor.Focus', [Editor]);

                if ($EditorArea.attr('class').match(/Error/)) {
                    window.setTimeout(function () {
                        CKEDITOR.instances[EditorID].updateElement();
                        Core.Form.Validate.ValidateElement($EditorArea);
                    }, 0);
                }
            });

            // mainly needed for client-side validation
            $EditorArea.focus(function () {
                TargetNS.Focus($EditorArea);
                Core.UI.ScrollTo($("label[for=" + $EditorArea.attr('id') + "]"));
            });
        }
    };

    /**
     * @name InitAll
     * @memberof Core.UI.RichTextEditor
     * @function
     * @description
     *      This function initializes as a rich text editor every textarea element that containing the RichText class.
     */
    TargetNS.InitAll = function () {
        $('textarea.RichText').each(function () {
            TargetNS.Init($(this));
        });
    };

    /**
     * @name GetRTE
     * @memberof Core.UI.RichTextEditor
     * @function
     * @returns {jQueryObject} jQuery object of the corresponsing RTE element.
     * @param {jQueryObject} $EditorArea - The jQuery object of the element that is a rich text editor.
     * @description
     *      Get RTE jQuery element.
     */
    TargetNS.GetRTE = function ($EditorArea) {
        var $RTE;

        if (isJQueryObject($EditorArea)) {
            $RTE = $('#cke_' + $EditorArea.attr('id'));
            return ($RTE.length ? $RTE : undefined);
        }
    };

    /**
     * @name UpdateLinkedField
     * @memberof Core.UI.RichTextEditor
     * @function
     * @param {jQueryObject} $EditorArea - The jQuery object of the element that is a rich text editor.
     * @description
     *      This function updates the linked field for a rich text editor.
     */
    TargetNS.UpdateLinkedField = function ($EditorArea) {
        var EditorID = '',
            Data,
            StrippedContent;

        if (isJQueryObject($EditorArea) && $EditorArea.length === 1) {
            EditorID = $EditorArea.attr('id');
        }

        if (EditorID === '') {
            Core.Exception.Throw('RichTextEditor: Need exactly one EditorArea!', 'TypeError');
        }

        Data = CKEDITOR.instances[EditorID].getData();
        StrippedContent = Data.replace(/\s+|&nbsp;|<\/?\w+[^>]*\/?>/g, '');

        if (StrippedContent.length === 0 && !Data.match(/<img/)) {
            $EditorArea.val('');
        }
        else {
            $EditorArea.val(Data);
        }
    };

    /**
     * @name IsEnabled
     * @memberof Core.UI.RichTextEditor
     * @function
     * @returns {Boolean} True if RTE is enabled, false otherwise
     * @param {jQueryObject} $EditorArea - The jQuery object of the element that is a rich text editor.
     * @description
     *      This function check if a rich text editor is enable in this moment.
     */
    TargetNS.IsEnabled = function ($EditorArea) {
        if (typeof CKEDITOR === 'undefined') {
            return false;
        }

        if (isJQueryObject($EditorArea) && $EditorArea.length) {
            return (CKEDITOR.instances[$EditorArea[0].id] ? true : false);
        }
        return false;
    };

    /**
     * @name Focus
     * @memberof Core.UI.RichTextEditor
     * @function
     * @param {jQueryObject} $EditorArea - The jQuery object of the element that is a rich text editor.
     * @description
     *      This function focusses the given RTE.
     */
    TargetNS.Focus = function ($EditorArea) {
        var EditorID = '';

        if (isJQueryObject($EditorArea) && $EditorArea.length === 1) {
            EditorID = $EditorArea.attr('id');
        }

        if (EditorID === '') {
            Core.Exception.Throw('RichTextEditor: Need exactly one EditorArea!', 'TypeError');
        }

        if (typeof CKEDITOR === 'object') {
            CKEDITOR.instances[EditorID].focus();
        }
        else {
            $EditorArea.focus();
        }
    };

    return TargetNS;
}(Core.UI.RichTextEditor || {}));
