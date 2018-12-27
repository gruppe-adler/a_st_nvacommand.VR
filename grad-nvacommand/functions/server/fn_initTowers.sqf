// private _towers = nearestTerrainObjects [[worldSize/2, worldSize/2], ["watchtowerclassname"], worldSize/2];


private _towers = entities [["fakeTowerclassname"], [], false, true];

{
	_x setVariable ["GRAD_nvaCommand_towerIsManned", 4, true];
	_x setVariable ["GRAD_nvaCommand_towerID", _forEachIndex, true];

} forEach _towers;

missionNamespace setVariable ["GRAD_nvaCommand_towerList", _towers, true];