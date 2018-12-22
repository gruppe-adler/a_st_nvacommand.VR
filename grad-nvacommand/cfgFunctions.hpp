class GRAD_nvacommand {

  	class client {
    		file = grad-nvacommand\functions\client;

    		class alarmDismissAction;
        class addRepairAction { postInit = 1; };
    		class addMapEventhandler;
    		class initMap;
        class raiseAlarm;
        class repairFence;
  	};

    class server {
         file = grad-nvacommand\functions\server;

         class addCBAEvents { postInit = 1; };
         class addSectorPoint;
         class generateSectors;
         class getTrianglesForSector;
         class handleAlarm;
         class serverLoop { postInit = 1; };
    };
};