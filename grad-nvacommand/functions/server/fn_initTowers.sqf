// private _towers = nearestTerrainObjects [[worldSize/2, worldSize/2], ["watchtowerclassname"], worldSize/2];


private _towers = (allMissionObjects "Land_Hlaska") + (nearestTerrainObjects [[worldSize/2, worldSize/2], ["Land_Hlaska"], worldSize/2]);

{
	private _tower = _x;
	_tower setVariable ["GRAD_nvaCommand_towerIsManned", 4, true];
	_tower setVariable ["GRAD_nvaCommand_towerID", _forEachIndex, true];

} forEach _towers;

// add towers to all curators to edit/access
{
	_x addCuratorEditableObjects [_towers,true ];
} forEach allCurators;

missionNamespace setVariable ["GRAD_nvaCommand_towerList", _towers, true];