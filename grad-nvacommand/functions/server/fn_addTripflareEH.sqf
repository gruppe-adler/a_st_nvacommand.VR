["ace_tripflareTriggered", {
        
        params ["_flare", "_position"];

        private _sectors = missionNamespace getVariable ["GRAD_NVACOMMAND_SECTORS", []];
        private _triggeredTriangles = missionNamespace getVariable ["GRAD_nvacommand_triggeredTriangles", []];

        {   
            private _sector = _x;
            if (_position inPolygon _sector) then {            
                private _triangles = [_sector] call GRAD_nvacommand_fnc_getTrianglesForSector;
                _triggeredTriangles append _triangles;
                missionNamespace setVariable ["GRAD_nvacommand_triggeredTriangles", _triggeredTriangles];

                systemChat "triggered Flare";
            } forEach allPlayers;
        } forEach _sectors;

}] call CBA_fnc_addEventHandler;