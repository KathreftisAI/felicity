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
// ITSM.Agent.ChangeManagement.WorkorderGraph = ITSM.Agent.ChangeManagement.WorkorderGraph || {};

/**
 * @namespace
 * @exports TargetNS as ITSM.Agent.ChangeManagement.WorkorderGraph
 * @description
 *      This namespace contains the special module functions for the workorder graph.
 */
ITSM.Agent.ChangeManagement.WorkorderGraph = (function (TargetNS) {

    /**
     * @function
     * @return nothing
     *      This function initializes the workorder graph
     */
    TargetNS.Init = function () {
        function GetDetailPosition(Element, Event) {
            var $Details = $(Element).next('.WorkorderDetails'),
                MousePositionLeft = parseInt(Event.pageX, 10),
                MousePositionTop = parseInt(Event.pageY, 10),
                BoxPosition = $(Element).closest('div.WorkorderGraph').offset(),
                BoxWidth = $(Element).closest('div.WorkorderGraph').width(),
                DetailWidth = $Details.width(),
                DetailPositionLeft = MousePositionLeft - parseInt(BoxPosition.left, 10) + 15,
                DetailPositionTop = MousePositionTop - parseInt(BoxPosition.top, 10) + 15;

            // if there is not enough space to the right to show the detail box,
            // show it on the left side of the mouse cursor
            if (DetailPositionLeft + DetailWidth + 15 > BoxWidth) {
                DetailPositionLeft = DetailPositionLeft - 400 - 30; // 30 because we added 15 to the right and now want 15 to the left
            }

            return {
                Left: DetailPositionLeft,
                Top: DetailPositionTop
            };
        }

        $('div.Workorder a')
        .unbind('mouseenter').bind('mouseenter', function (Event) {
            var DetailPosition = GetDetailPosition(this, Event);
            $(this).next('.WorkorderDetails')
                .css('left', DetailPosition.Left)
                .css('top', DetailPosition.Top)
                .show();
        })
        .unbind('mouseleave').bind('mouseleave', function (Event) {
            $(this).next('.WorkorderDetails').hide();
        })
        .unbind('mousemove').bind('mousemove', function (Event) {
            var DetailPosition = GetDetailPosition(this, Event);
            $(this).next('.WorkorderDetails')
                .css('left', DetailPosition.Left)
                .css('top', DetailPosition.Top);
        });
    };

    return TargetNS;
}(ITSM.Agent.ChangeManagement.WorkorderGraph || {}));
