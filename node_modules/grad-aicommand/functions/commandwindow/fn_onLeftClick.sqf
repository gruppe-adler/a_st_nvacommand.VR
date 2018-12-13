#include "script_component.hpp"

params ["_mapCtrl","_button","_x","_y","_shift","_alt","_ctrl"];

if (missionNamespace getVariable [QGVAR(contextmenu_isOpen),false]) exitWith {};
if (missionNamespace getVariable [QGVAR(isDeleteClick),false]) exitWith {};

private _mousePosWorld = _mapCtrl ctrlMapScreenToWorld [_x,_y];

private _nearestGroup = [_mousePosWorld] call FUNC(findNearestEditableGroup);
private _grpWorldPos = getPos leader _nearestGroup;
private _grpScreenPos = _mapCtrl ctrlMapWorldToScreen _grpWorldPos;
private _clickDistance = _grpScreenPos distance [_x,_y];

private _previousGroup = missionNamespace getVariable [QGVAR(currentGroup),grpNull];

// click on group
if (_clickDistance < 0.04 && {!isNull _nearestGroup}) then {

    if (GVAR(currentGroup) != _nearestGroup) then {
        GVAR(currentGroup) = _nearestGroup;
        [GVAR(currentGroup)] call GVAR(onGroupSelected);

        if (!isNull _previousGroup) then {
            [_previousGroup] call GVAR(onGroupUnselected);
        };
    };

// click on map
} else {
    GVAR(currentGroup) = grpNull;

    if (!isNull _previousGroup) then {
        [_previousGroup] call GVAR(onGroupUnselected);        
    };
};
