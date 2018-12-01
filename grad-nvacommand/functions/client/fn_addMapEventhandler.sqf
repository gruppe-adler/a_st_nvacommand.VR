// add map draw eh
(findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw", 
{
    params ["_map"];

    if (player getVariable ["GRAD_nvacommand_isCommander", false]) then {

    	private _activeTriangles = missionNamespace getVariable ["GRAD_nvacommand_triggeredTriangles", []];
    	_map drawTriangle [_activeTriangles, [1,0,0,0.5], "#(rgb,1,1,1)color(1,1,1,0.25)"];  
	
	};
    // systemChat format ["_activeTriangles: %1", _activeTriangles];
}];