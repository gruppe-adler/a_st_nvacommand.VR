params ["_tower"];

private _positionBehindDoor = _tower modelToWorld [0,0,-3];
private _positionInFrontOfDoor = _tower modelToWorld [0,10,-3];
private _towerCrewCount = _tower getVariable ["GRAD_nvaCommand_towerIsManned", 0];
private _group = createGroup east;

for "_i" from 1 to (count _towerCrewCount) do {
	_group createUnit ["B_RangeMaster_F", _positionBehindDoor, [], 0, "CAN_COLLIDE"];
};

// mark for auto deletion when necessary
_group deleteGroupWhenEmpty true;

// set tower crew to zero
_tower setVariable ["GRAD_nvaCommand_towerIsManned", 0, true];

// set group BFT name
private _towerID = _tower getVariable ["GRAD_nvaCommand_towerID", 0];
private _groupID = format ["Alarmtruppe T%1", _towerID];

// move out
_group setGroupIdGlobal [_groupID];
_group addWaypoint [_positionInFrontOfDoor, 0];