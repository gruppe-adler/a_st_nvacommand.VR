class GRAD_nvacommand {
    class server {
       file = grad-nvacommand\functions\server;

       class addSectorPoint;
       class addTripflareEH { postInit = 1; };
       class generateSectors;
       class getTrianglesForSector;
       class serverLoop { postInit = 1; };
    };
};