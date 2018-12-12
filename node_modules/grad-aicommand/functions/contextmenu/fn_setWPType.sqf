#include "script_component.hpp"

params ["_type"];

private _currentGroup = missionNamespace getVariable [QGVAR(currentGroup),grpNull];
if (isNull _currentGroup) exitWith {};

private _currentWaypoint = _currentGroup getVariable [QGVAR(selectedWaypoint),[]];
if (count _currentWaypoint == 0) exitWith {};

if (_type in ["MOVE","CYCLE","GETIN NEAREST","GETOUT"]) then {
    [_currentWaypoint,_type] remoteExecCall ["setWaypointType",2,false];
};
