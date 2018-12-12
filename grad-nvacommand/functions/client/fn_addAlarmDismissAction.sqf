addMissionEventHandler ["MapSingleClick", {
	params ["_units", "_pos", "_alt", "_shift"];

	// get sectors and already triggered sectors
    private _triggeredSectors = missionNamespace getVariable ["GRAD_nvacommand_triggeredSectors", []];
    private _untriggeredSectors = missionNamespace getVariable ["GRAD_nvacommand_untriggeredSectors", []];
    private _triggeredSectorsTemp = + _triggeredSectors;
    private _dismissal = false; // todo inactive/active sectors

	{   
            private _sector = _x;
            if (_pos inPolygon _sector) then {           
                
                private _deleteIndex = _triggeredSectorsTemp find _x;
                _untriggeredSectors append [_x];
                _triggeredSectorsTemp deleteAt _deleteIndex;

                _dismissal = true;
            };
    } forEach _triggeredSectors;


    missionNamespace setVariable ["GRAD_nvacommand_triggeredSectors", _triggeredSectorsTemp];
    missionNamespace setVariable ["GRAD_nvacommand_untriggeredSectors", _untriggeredSectors];


    if (_dismissal) then {
        systemChat localize ("str_nvacommand_alarmDismissed");
    };
}];