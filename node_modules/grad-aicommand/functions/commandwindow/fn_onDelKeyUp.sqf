#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "script_component.hpp"

params [["_display",displayNull]];

private _mapCtrl = _display displayCtrl GRAD_AICOMMAND_COMMANDWINDOW_MAP;
if (isNull _mapCtrl) exitWith {};

private _currentGroup = missionNamespace getVariable [QGVAR(currentGroup),grpNull];
if (isNull _currentGroup) exitWith {};

private _mousePosScreen = getMousePosition;
private _mousePosWorld = _mapCtrl ctrlMapScreenToWorld _mousePosScreen;

private _nearestWaypoint = [_mousePosWorld, _currentGroup] call FUNC(findNearestWP);
// null waypoint is empty array
if (count _nearestWaypoint == 0) exitWith {};

private _waypointPosWorld = waypointPosition _nearestWaypoint;
private _waypointPosScreen = _mapCtrl ctrlMapWorldToScreen _waypointPosWorld;

// nearest waypoint too far away
if (_waypointPosScreen distance _mousePosScreen > 0.03) exitWith {};

deleteWaypoint _nearestWaypoint;
