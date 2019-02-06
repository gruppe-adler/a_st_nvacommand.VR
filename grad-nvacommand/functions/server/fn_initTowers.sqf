// private _towers = nearestTerrainObjects [[worldSize/2, worldSize/2], ["watchtowerclassname"], worldSize/2];

private _towerType = "Land_Hlaska";
private _terrainTowers = 
	(allMissionObjects _towerType) + 
	(nearestTerrainObjects [[worldSize/2, worldSize/2], [_towerType], worldSize/2]);

private _replacementTowers = [];

{
	private _tower = _x;

	private _vectorDir = vectorDir _tower;
	private _vectorUp = vectorUp _tower;
	private _position = getPosATL _tower;
	private _type = typeof _tower;

	// hide terrain object
	_tower setDamage [1, false];
	deleteVehicle _tower;
	hideObjectGlobal _tower;

	// replace with own version
	private _replacementTower = _type createVehicle [0,0,0];
	_replacementTower setVectorDir _vectorDir;
	_replacementTower setVectorUp _vectorUp;
	_replacementTower setPosATL _position;

	_replacementTower setVariable ["GRAD_nvaCommand_towerIsManned", 4, true];
	_replacementTower setVariable ["GRAD_nvaCommand_towerID", _forEachIndex, true];

	_replacementTowers pushBackUnique _replacementTower;
} forEach _terrainTowers;

// add towers to all curators to edit/access
{
	private _curator = _x;
	_curator addCuratorEditableObjects [_replacementTowers,true ];
	
	{
	  [ _curator, ["\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa", [1,1,1,1], position _x, 1, 1, 45, "Tower", 1, 0.05, "TahomaB"], false ] call BIS_fnc_addCuratorIcon;
	} forEach _replacementTowers;

} forEach allCurators;

missionNamespace setVariable ["GRAD_nvaCommand_towerList", _replacementTowers, true];