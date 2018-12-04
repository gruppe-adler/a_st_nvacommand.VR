// todo: remove after dev
player setVariable ["GRAD_nvacommand_isCommander", true];


// add map draw eh
(findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw", 
{
    params ["_map"];

    if (player getVariable ["GRAD_nvacommand_isCommander", false]) then {

    	private _triggeredSectors = missionNamespace getVariable ["GRAD_nvacommand_triggeredSectors", []];
        private _untriggeredSectors = missionNamespace getVariable ["GRAD_nvacommand_untriggeredSectors", []];

        
        private _mouseToWorld = _map ctrlMapScreenToWorld getMousePosition;
        _mouseToWorld set [2,0];
        
            
       
        // _tooltipCtrl ctrlSetText format ["%1", _mouseToWorld]; 
        {
          private _identifier = _x select 0;
          private _sector = _x select 1;
          private _color = [1,0,0,0.5 + abs(((sin(time * 100))/2))];

          if (_mouseToWorld inPolygon _sector) then {
             ((findDisplay 12) displayCtrl 1234) ctrlSetText format ["Sector ALARM: %1", _identifier];
             _color = [1,0,0,1];
          };
          _map drawTriangle [_sector, _color, "#(rgb,1,1,1)color(1,1,1,1)"];
        } forEach _triggeredSectors;

        {
          private _identifier = _x select 0;
          private _sector = _x select 1;
          private _color = [0,0,0,0.2];

          if (_mouseToWorld inPolygon _sector) then {
             ((findDisplay 12) displayCtrl 1234) ctrlSetText format ["Sector: %1", _identifier];
             _color = [0,0,0,0.5];
          };
          _map drawTriangle [_sector, _color, "#(rgb,1,1,1)color(1,1,1,1)"];
        } forEach _untriggeredSectors;
        
	   // copyToClipboard format ["_triggeredSectors: %1 --- _untriggeredSectors: %2", _triggeredSectors, _untriggeredSectors];
	};
   
}];


addMissionEventHandler ["Map", {
    params ["_mapIsOpened", "_mapIsForced"];

    if (!_mapIsOpened) exitWith {
        ctrlDelete ((findDisplay 12) displayCtrl 1234);
    };

    private _textfield = (findDisplay 12) ctrlCreate ["RscText", 1234]; 
 
    _textfield ctrlsetText "BLABLA"; 
    _textfield ctrlSetPosition [0,0]; 
    _textfield ctrlSetBackgroundColor [0,0,0,1]; 
    _textfield ctrlCommit 0;

    /*
    [{
        params ["_args", "_handle"];
        _args params ["_textfield"];

        _textfield ctrlSetPosition getMousePosition;
        _textfield ctrlSetText format ["%1", getMousePosition];

    }, 0, [_textfield]] call CBA_fnc_addPerFrameHandler;
    */
}];

/*

(findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw", 
{
    params ["_map"]; 

        {
            _map drawTriangle [_x, [1,0,0,0.5], "#(rgb,1,1,1)color(1,1,1,1)"];
        } forEach [[[1520.04,5096.9,0],[1523.01,5080.09,0],[1538.01,5083.53,0],[1541.01,5095.75,0]],[[1526.78,5104.7,0],[1520.04,5096.9,0],[1541.01,5095.75,0],[1537.21,5106.8,0]],[[1537.21,5106.8,0],[1541.01,5095.75,0],[1557.22,5097.59,0],[1555.4,5108.71,0],[1547.28,5108.44,0]],[[1541.01,5095.75,0],[1538.01,5083.53,0],[1552.94,5081.9,0],[1557.22,5097.59,0]],[[1552.94,5081.9,0],[1568.71,5086.39,0],[1570.93,5098.27,0],[1557.22,5097.59,0]],[[1567.13,5109.32,0],[1555.4,5108.71,0],[1557.22,5097.59,0],[1570.93,5098.27,0]],[[1567.13,5109.32,0],[1570.93,5098.27,0],[1589.78,5103.87,0],[1582.65,5125.57,0]],[[1570.93,5098.27,0],[1568.71,5086.39,0],[1596.42,5094.9,0],[1589.78,5103.87,0]],[[1582.65,5125.57,0],[1589.78,5103.87,0],[1601.68,5121.06,0],[1603.12,5138.48,0]],[[1589.78,5103.87,0],[1596.42,5094.9,0],[1608.18,5112.18,0],[1601.68,5121.06,0]],[[1603.12,5138.48,0],[1601.68,5121.06,0],[1619.5,5125.04,0],[1618.95,5140.79,0]],[[1601.68,5121.06,0],[1608.18,5112.18,0],[1625.19,5115.98,0],[1619.5,5125.04,0]],[[1618.95,5140.79,0],[1619.5,5125.04,0],[1643.96,5132.03,0],[1640.16,5143.08,0]],[[1619.5,5125.04,0],[1625.19,5115.98,0],[1650.59,5124.17,0],[1643.96,5132.03,0]],[[1640.16,5143.08,0],[1643.96,5132.03,0],[1660.09,5148.12,0],[1655.31,5166.39,0]],[[1643.96,5132.03,0],[1650.59,5124.17,0],[1666.72,5140.26,0],[1660.09,5148.12,0]]];
}];

*/