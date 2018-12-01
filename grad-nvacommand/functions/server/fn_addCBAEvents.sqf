["ace_tripflareTriggered", {
        
        params ["_flare", "_position"];

        // get sectors and already triggered sectors
        private _sectors = missionNamespace getVariable ["GRAD_NVACOMMAND_SECTORS", []];
        private _triggeredTriangles = missionNamespace getVariable ["GRAD_nvacommand_triggeredTriangles", []];

        // check in which sector tripflare did go off
        {   
            private _sector = _x;
            if (_position inPolygon _sector) then {            
                private _triangles = [_sector] call GRAD_nvacommand_fnc_getTrianglesForSector;
                _triggeredTriangles append _triangles;
                missionNamespace setVariable ["GRAD_nvacommand_triggeredTriangles", _triggeredTriangles];

                systemChat localize ("str_nvacommand_tripflareTriggered");
            };
        } forEach _sectors;

}] call CBA_fnc_addEventHandler;


["ace_wireCuttingStarted", {
        
        params ["_unit", "_fence"];

        // get sectors and already triggered sectors
        private _sectors = missionNamespace getVariable ["GRAD_NVACOMMAND_SECTORS", []];
        private _triggeredTriangles = missionNamespace getVariable ["GRAD_nvacommand_triggeredTriangles", []];

        // check in which sector tripflare did go off
        {   
            private _sector = _x;
            if ((position _fence) inPolygon _sector) then {            
                private _triangles = [_sector] call GRAD_nvacommand_fnc_getTrianglesForSector;
                _triggeredTriangles append _triangles;
                missionNamespace setVariable ["GRAD_nvacommand_triggeredTriangles", _triggeredTriangles];

                systemChat localize ("str_nvacommand_fenceCut");
            };
        } forEach _sectors;

}] call CBA_fnc_addEventHandler;