params ["_position", "_type", ["_unit", objNull]];

// get sectors and already triggered sectors
private _triggeredSectors = missionNamespace getVariable ["GRAD_nvacommand_triggeredSectors", []];
private _untriggeredSectors = missionNamespace getVariable ["GRAD_nvacommand_untriggeredSectors", []];
private _untriggeredSectorsTemp = + _untriggeredSectors;

// copyToClipboard str _untriggeredSectors;

// check in which sector alarm did go off
{
    private _sector = _x select 1;

    // diag_log format ["alarm at %1 inPolygon %2", _position, _sector];

    if (_position inPolygon _sector) then {

        private _deleteIndex = _untriggeredSectorsTemp find _x;

        _triggeredSectors append [_x];
        _untriggeredSectorsTemp deleteAt _deleteIndex;
    };
} forEach _untriggeredSectors;

missionNamespace setVariable ["GRAD_nvacommand_triggeredSectors", _triggeredSectors];
missionNamespace setVariable ["GRAD_nvacommand_untriggeredSectors", _untriggeredSectorsTemp];


private _flare = "F_40mm_White" createVehicle _position;
_flare setVelocity [random 5, random 5, 50];
playSound3D ["A3\Sounds_F_Kart\Weapons\starting_pistol_1", player, false, _position, 50, 1, 100];


[_position] call GRAD_nvacommand_fnc_handleAlarm;

// give feedback whats happening
switch (_type) do { 
	case "fence" : { 
		systemChat localize ("str_nvacommand_fenceCut");
	}; 
	case "flare" : {
		systemChat localize ("str_nvacommand_tripflareTriggered");
	}; 
	default {
		systemChat "error: raiseAlarm called without type.";
	}; 
};