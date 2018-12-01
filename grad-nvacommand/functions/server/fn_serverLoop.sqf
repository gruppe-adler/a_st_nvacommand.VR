waitUntil { player == player };

private _dummies = missionNamespace getVariable ["GRAD_NVACOMMAND_SECTORPOINTS", []];
private _sectors = [_dummies] call GRAD_nvacommand_fnc_generateSectors;

diag_log format ["_sectors %1", _sectors];
systemChat str _sectors;

if (count _sectors == 0) exitWith {
     systemChat "please add sectors with '[this] call GRAD_nvacommand_fnc_addSectorPoint'; in object inits";
};


[{

    params ["_args", "_handle"];
    _args params ["_sectors"];

    private _triggeredTriangles = [];

    {
        if ((position player) inPolygon _x) then {
            systemChat ("sector: " + str _forEachIndex);
            private _triangles = [_x] call GRAD_nvacommand_fnc_getTrianglesForSector;
            diag_log format ["triangles calculated: %1", _triangles];
            missionNamespace setVariable ["GRAD_nvacommand_triggeredTriangles", _triangles];            
        };
    } forEach _sectors;
    

}, 1, [_sectors]] call CBA_fnc_addPerFrameHandler;

// add map draw eh
(findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw", 
{
    params ["_map"];

    private _activeTriangles = missionNamespace getVariable ["GRAD_nvacommand_triggeredTriangles", []];

    _map drawTriangle [_activeTriangles, [1,0,0,0.5], "#(rgb,1,1,1)color(1,1,1,0.25)"];  
    

    diag_log format ["_activeTriangles: %1", _activeTriangles];
    
}];

/* 

[
    [
        [1543.83,5046.57,0],
        [1559.35,5051.59,0],
        [1561.82,5062.94,0],
        [1558.02,5073.99,0],
        [1547.59,5071.89,0],
        [1548.1,5062.26,0]
    ]
]

*/