#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "script_component.hpp"

params [["_display",displayNull]];

private _height = [GRAD_AICOMMAND_HELP_H_COLLAPSED,GRAD_AICOMMAND_HELP_H_EXPANDED] select (missionNamespace getVariable [QGVAR(helpOpen),false]);

private _controlsGroup = _display ctrlCreate ["RscControlsGroupNoScrollbars",GRAD_AICOMMAND_HELP_CG];
_controlsGroup ctrlSetPosition [GRAD_AICOMMAND_HELP_X,GRAD_AICOMMAND_HELP_Y,GRAD_AICOMMAND_HELP_W,_height];
_controlsGroup ctrlCommit 0;

private _background = _display ctrlCreate ["RscBackground",-1,_controlsGroup];
_background ctrlSetPosition [0,0,GRAD_AICOMMAND_HELP_W,GRAD_AICOMMAND_HELP_H_EXPANDED];
_background ctrlSetBackgroundColor [0,0,0,0.75];
_background ctrlCommit 0;

private _ctrlText = _display ctrlCreate ["RscStructuredText",-1,_controlsGroup];
_ctrlText ctrlSetPosition [GRAD_AICOMMAND_HELP_TEXTPADDING_X,GRAD_AICOMMAND_HELP_TEXTPADDING_Y,GRAD_AICOMMAND_HELP_W - 2*GRAD_AICOMMAND_HELP_TEXTPADDING_X,GRAD_AICOMMAND_HELP_H_EXPANDED - 2*GRAD_AICOMMAND_HELP_TEXTPADDING_Y];
_ctrlText ctrlCommit 0;

// set text size based on ratio of current uiScale and resolution to dev uiScale and resolution
getResolution params ["_resW","_resH","","","_aspectRatio","_uiScale"];
private _uiScaleRatio = _uiScale/0.55;
private _resRatio = [1440/_resH,2560/_resW] select (_aspectRatio > 1.77778);

private _textSize = 0.8 * _uiScaleRatio * _resRatio;
private _highlightColor = "#2eea54";
_ctrlText ctrlSetStructuredText parseText format ["<t size='%2'>
Press <t color='%1'>[H]</t> to toggle help.<br/>
<br/>
<t color='%1'>select group</t> - Left click on a group to select it. Anywhere else to unselect it.<br/>
<br/>
<t color='%1'>create waypoint</t> - Double click anywhere to create a waypoint for the selected group.<br/>
<br/>
<t color='%1'>move waypoint</t> - Drag &amp; drop a waypoint to move it.<br/>
<br/>
<t color='%1'>delete waypoint</t> - Select delete from the contextmenu or press [del] while holding your mouse over a waypoint to delete it.<br/>
<br/>
<t color='%1'>edit waypoint</t> - Right click a waypoint to open its context menu.<br/>
<br/>
<t color='%1'>edit group</t> - Right click a group to open its context menu.<br/>
<br/>
<t color='%1'>close aiCommand</t> - Close this dialog like you would close the map.<br/>
</t>",_highlightColor,_textSize];
