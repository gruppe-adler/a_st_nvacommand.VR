waitUntil { player == player };

private _dummies = missionNamespace getVariable ["GRAD_NVACOMMAND_SECTORPOINTS", []];
private _sectors = [_dummies] call GRAD_nvacommand_fnc_getFaces;

diag_log format ["_sectors %1", _sectors];
systemChat str _sectors;

if (count _sectors == 0) exitWith {
     systemChat "please add sectors with '[this] call GRAD_nvacommand_fnc_addSectorPoint'; in object inits";
};

[{
    params ["_args", "_handle"];
    _args params ["_sectors"];

    {
        if ((position player) inPolygon _x) then {
            systemChat ("sector: " + str _forEachIndex);
        };
    } forEach _sectors;
    

}, 1, [_sectors]] call CBA_fnc_addPerFrameHandler;