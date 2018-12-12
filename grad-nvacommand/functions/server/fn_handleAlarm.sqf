params ["_position"];

private _searchLights = nearestObjects [_position, ["rhs_KORD_high_MSV"], 1500];

// get nearest searchlights

if (count _searchLights > 0) then {
    _searchLights params ["_searchlightNearest", "_searchlight2ndNearest"];

    if (isNull _unit) then {
        _unit =  nearestObject [_position, "Man"];
    };

    if (!isNull _searchlightNearest && !(_searchlightNearest getVariable ["GRAD_nvacommand_alert", false])) then {
        _searchlightNearest reveal [_unit,4];
        _searchlightNearest doWatch _unit;
        _searchlightNearest doTarget _unit;
        _searchlightNearest setVariable ["GRAD_nvacommand_alert", true];
    };

    if (!isNull _searchlight2ndNearest && !(_searchlight2ndNearest getVariable ["GRAD_nvacommand_alert", false])) then {
        _searchlight2ndNearest reveal [_unit,4];
        _searchlight2ndNearest doWatch _unit;
        _searchlight2ndNearest doTarget _unit;
        _searchlight2ndNearest setVariable ["GRAD_nvacommand_alert", true];
    };

    private _count = 0;

    [{
        params ["_args", "_handle"];
        _args params ["_searchlightNearest", "_searchlight2ndNearest", "_count"];

        _count = _count + 1;

        if (_count > 60) exitWith {
            [_handle] call CBA_fnc_removePerFramehandler;
            _searchlightNearest setVariable ["GRAD_nvacommand_alert", false];
            _searchlight2ndNearest setVariable ["GRAD_nvacommand_alert", false];
        };
        
        [_searchlightNearest, ["GRAD_nvacommand_alarm", 1000]] remoteExec ["say3D", [0,-2] select isDedicated];
        [_searchlight2ndNearest, ["GRAD_nvacommand_alarm", 1000]] remoteExec ["say3D", [0,-2] select isDedicated];    
        
    }, 3.5, [_searchlightNearest, _searchlight2ndNearest, _count]] call CBA_fnc_addPerFramehandler;
};
