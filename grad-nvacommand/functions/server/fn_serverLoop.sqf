waitUntil { player == player };

private _dummies = missionNamespace getVariable ["GRAD_NVACOMMAND_SECTORRAWDATA", []];
private _sectors = [_dummies] call GRAD_nvacommand_fnc_generateSectors;

missionNamespace setVariable ["GRAD_NVACOMMAND_SECTORS", _sectors, true];

diag_log format ["_sectors %1", _sectors];
systemChat str _sectors;

if (count _sectors == 0) exitWith {
     systemChat "please add sectors with '[this] call GRAD_nvacommand_fnc_addSectorPoint'; in object inits";
};

/*
[{

    params ["_args", "_handle"];
    _args params ["_sectors"];

    private _triggeredTriangles = [];

    {   
        private _sector = _x;
        {
            private _player = _x;

            if ((position _player) inPolygon _sector) then {
                private _triangles = [_sector] call GRAD_nvacommand_fnc_getTrianglesForSector;
                _triggeredTriangles append _triangles;
                missionNamespace setVariable ["GRAD_nvacommand_triggeredTriangles", _triggeredTriangles];
            };
        } forEach allPlayers;
    } forEach _sectors;
    
}, 1, [_sectors]] call CBA_fnc_addPerFrameHandler;
*/