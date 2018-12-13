params ["_aiCommandParams"];
_aiCommandParams params ["_unit","_player","_display","_map"];

systemChat (str _display + " " + str _map);
diag_log str (str _display + " " + str _map);

[_unit, _player, _display, _map] call GRAD_nvacommand_fnc_addMapEventhandler;


_map ctrlAddEventHandler ["MouseButtonClick", {
    params ["_mapCtrl","_button","_xPos","_yPos","_shift","_alt","_ctrl"];

    // currently nothing but left- and rightclick
    if (_button > 1) exitWith {};

    if (_button == 0) then {
        private _position = _mapCtrl ctrlMapScreenToWorld [_xPos, _yPos];
        [_position] call GRAD_nvacommand_fnc_alarmDismissAction;
    } else {
        systemChat "rightclick";
    };

    false
}];