class GRAD_nvacommand {

	class client {
		file = grad-nvacommand\functions\client;

		class addAlarmDismissAction { postInit = 1; };
		class addMapEventhandler { postInit = 1; };
		class raiseAlarm;
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