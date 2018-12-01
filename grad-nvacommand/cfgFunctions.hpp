class GRAD_nvacommand {
    class server {
       file = grad-nvacommand\functions\server;

       class addCBAEvents { postInit = 1; };
       class addSectorPoint;
       class generateSectors;
       class getTrianglesForSector;
       class serverLoop { postInit = 1; };
    };
};