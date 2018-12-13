#include "script_component.hpp"

params ["_mapCtrl","_button","_x","_y","_shift","_alt","_ctrl"];

if (missionNamespace getVariable [QGVAR(contextmenu_isOpen),false]) exitWith {};
if (missionNamespace getVariable [QGVAR(isDeleteClick),false]) exitWith {};

private _mousePosWorld = _mapCtrl ctrlMapScreenToWorld [_x,_y];

private _currentGroup = missionNamespace getVariable [QGVAR(currentGroup),objNull];
private _wp = _currentGroup addWaypoint [_mousePosWorld,0];
_wp setWaypointType "MOVE";

private _garrisonedUnits = (units _currentGroup) select {_x getVariable ["ace_ai_garrisonned",false]};
if (count _garrisonedUnits > 0) then {
    [_garrisonedUnits] remoteExecCall [QFUNC(unGarrison),0,false];
};

[_wp,_currentGroup] call GVAR(onWaypointCreated);
