params ["_position", "_type"];

playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", player];


// get sectors and already triggered sectors
private _sectors = missionNamespace getVariable ["GRAD_NVACOMMAND_SECTORS", []];
private _triggeredTriangles = missionNamespace getVariable ["GRAD_nvacommand_triggeredTriangles", []];


// check in which sector alarm did go off
{   
    private _sector = _x;
    if (_position inPolygon _sector) then {            
        private _triangles = [_sector] call GRAD_nvacommand_fnc_getTrianglesForSector;

        // add sector triangles to already active sectors
        _triggeredTriangles append _triangles;
        missionNamespace setVariable ["GRAD_nvacommand_triggeredTriangles", _triggeredTriangles];
    };
} forEach _sectors;


// give feedback whats happening
switch (_type) do { 
	case "fence" : { 
		systemChat localize ("str_nvacommand_fenceCut");
	}; 
	case "tripflare" : {
		systemChat localize ("str_nvacommand_tripflareTriggered");
	}; 
	default {
		systemChat "error: raiseAlarm called without type.";
	}; 
};