addMissionEventHandler ["MapSingleClick", {
	params ["_units", "_pos", "_alt", "_shift"];

	// get sectors and already triggered sectors
    private _sectors = missionNamespace getVariable ["GRAD_NVACOMMAND_SECTORS", []];
    private _triggeredTriangles = missionNamespace getVariable ["GRAD_nvacommand_triggeredTriangles", []];

	{   
            private _sector = _x;
            if (_pos inPolygon _sector) then {            
                private _triangles = [_sector] call GRAD_nvacommand_fnc_getTrianglesForSector;
                private _intersections = _triangles arrayIntersect _triggeredTriangles;

                {
                	_triggeredTriangles deleteAt (_triggeredTriangles find _x);
                } forEach _intersections;

                missionNamespace setVariable ["GRAD_nvacommand_triggeredTriangles", _triggeredTriangles, true];

                systemChat localize ("str_nvacommand_alarmDismissed");
            };
        } forEach _sectors;
}];