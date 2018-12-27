params ["_tower"];

private _positionBehindDoor = _tower modelToWorld [0,1,-2];
private _positionInFrontOfDoor = _tower modelToWorld [0,10,-2];
private _towerCrewCount = _tower getVariable ["GRAD_nvaCommand_towerIsManned", 4];
private _group = createGroup east;

if (_towerCrewCount < 1) exitWith {};

systemChat "tower alarm";

for "_i" from 1 to (_towerCrewCount) do {
	_group createUnit ["rhs_msv_rifleman", _positionBehindDoor, [], 0, "CAN_COLLIDE"];
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