// private _towers = nearestTerrainObjects [[worldSize/2, worldSize/2], ["watchtowerclassname"], worldSize/2];


private _towers = (allMissionObjects "Land_Hlaska") + (nearestTerrainObjects [[worldSize/2, worldSize/2], ["Land_Hlaska"], worldSize/2]);

{
	private _tower = _x;
	_tower setVariable ["GRAD_nvaCommand_towerIsManned", 4, true];
	_tower setVariable ["GRAD_nvaCommand_towerID", _forEachIndex, true];

} forEach _towers;

// add towers to all curators to edit/access
{
	private _curator = _x;
	_curator addCuratorEditableObjects [_towers,true ];


	
	{
	  [ _curator, ["\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa", [1,1,1,1], position _x, 1, 1, 45, "Tower", 1, 0.05, "TahomaB"], false ] call BIS_fnc_addCuratorIcon;
	} forEach _towers;

} forEach allCurators;

missionNamespace setVariable ["GRAD_nvaCommand_towerList", _towers, true];