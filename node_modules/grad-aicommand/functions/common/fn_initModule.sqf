#include "script_component.hpp"

if (isNil QGVAR(canReceiveCommandsDefault)) then {
    GVAR(canReceiveCommandsDefault) = ([(missionConfigFile >> "CfgGradAICommand" >> "canReceiveCommandsDefault"),"number",1] call CBA_fnc_getConfigEntry) == 1;
};
if (isNil QGVAR(canGiveCommandsDefault)) then {
    GVAR(canGiveCommandsDefault) = ([(missionConfigFile >> "CfgGradAICommand" >> "canGiveCommandsDefault"),"number",1] call CBA_fnc_getConfigEntry) == 1;
};
if (isNil QGVAR(canUseHighcommandDefault)) then {
    GVAR(canUseHighcommandDefault) = ([(missionConfigFile >> "CfgGradAICommand" >> "canUseHighcommandDefault"),"number",0] call CBA_fnc_getConfigEntry) == 1;
};

if (isNil QGVAR(onMapOpenend)) then {
    GVAR(onMapOpenend) = compile ([missionConfigFile >> "CfgGradAICommand","onMapOpenend",""] call BIS_fnc_returnConfigEntry);
};

if (isNil QGVAR(onGroupSelected)) then {
    GVAR(onGroupSelected) = compile ([missionConfigFile >> "CfgGradAICommand","onMapOpenend",""] call BIS_fnc_returnConfigEntry);
};

if (isNil QGVAR(onWaypointSelected)) then {
    GVAR(onWaypointSelected) = compile ([missionConfigFile >> "CfgGradAICommand","onWaypointSelected",""] call BIS_fnc_returnConfigEntry);
};

if (isNil QGVAR(onWaypointCreated)) then {
    GVAR(onWaypointCreated) = compile ([missionConfigFile >> "CfgGradAICommand","onWaypointCreated",""] call BIS_fnc_returnConfigEntry);
};

if (hasInterface) then {
    _action = ["grad_aicommand_actionNode", "AI command", "\A3\ui_f\data\igui\cfg\simpleTasks\types\whiteboard_ca.paa", {[FUNC(openCommandWindow),_this] call CBA_fnc_execNextFrame}, {[group (_this select 0)] call FUNC(isEditableGroup)}] call ace_interact_menu_fnc_createAction;
    ["CAManBase",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;

    _action = ["grad_aicommand_highcommandAction", "AI command", "\A3\ui_f\data\igui\cfg\simpleTasks\types\whiteboard_ca.paa", {[FUNC(openCommandWindow),_this] call CBA_fnc_execNextFrame}, {(_this select 1) getVariable [QGVAR(canUseHighcommand),GVAR(canUseHighcommandDefault)]}] call ace_interact_menu_fnc_createAction;
    ["CAManBase",1,["ACE_SelfActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;
};
