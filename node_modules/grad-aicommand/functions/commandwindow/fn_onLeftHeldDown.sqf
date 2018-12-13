#include "script_component.hpp"

params ["_mapCtrl","_button","_x","_y","_shift","_alt","_ctrl"];

if (missionNamespace getVariable [QGVAR(contextmenu_isOpen),false]) exitWith {};
if (missionNamespace getVariable [QGVAR(isDeleteClick),false]) exitWith {};

private _mousePosWorld = _mapCtrl ctrlMapScreenToWorld [_x,_y];

private _currentGroup = missionNamespace getVariable [QGVAR(currentGroup),grpNull];
if (isNull _currentGroup) exitWith {};

private _nearestWaypoint = [_mousePosWorld, _currentGroup] call FUNC(findNearestWP);

// null waypoint is empty array
if (count _nearestWaypoint > 0) then {
    [{
        params ["_args","_handle"];
        _args params ["_currentGroup","_nearestWaypoint","_mapCtrl"];

        if (!GVAR(leftButtonDown) || isNull _mapCtrl || isNull _currentGroup) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
        };

        _mousePosWorld = _mapCtrl ctrlMapScreenToWorld getMousePosition;
        _nearestWaypoint setWaypointPosition [_mousePosWorld,0];

    },0,[_currentGroup,_nearestWaypoint,_mapCtrl]] call CBA_fnc_addPerFrameHandler;
};
