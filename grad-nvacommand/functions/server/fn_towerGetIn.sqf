params ["_group", "_tower"];

private _positionBehindDoor = _tower modelToWorld [0,0,-3];
private _waypoint = _group addWaypoint [_positionBehindDoor, 0];
private _statement = format ["
	private _group = this;
	%1 setVariable ['GRAD_nvaCommand_towerIsManned', count _group, true]; 
	{ deleteVehicle _x; } forEach _group;
	", _tower];

_waypoint setWaypointStatements ["true", _statement];