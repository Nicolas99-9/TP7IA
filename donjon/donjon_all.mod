/*********************************************
Modèle simple permettant de trouver une solution
*********************************************/
using CP;


range n = 0..11; 
{string} directions = {"NordOuest" , "Nord", "SudOuest" , "SudEst" , "NordEst" , "Sud", "Est", "Ouest"};
dvar int c[directions] in n;
int nbSoldats = 0;





//----- Parametrage Solveur -----
execute{
   cp.param.searchType = "DepthFirst";
   cp.param.workers = 1;
}


constraints{
        
   (c["NordOuest"] + c["Nord"] + c["SudOuest"] + c["SudEst"] + c["NordEst"] + c["Sud"] + c["Est"] + c["Ouest"]) == 12;
   (c["NordOuest"]+c["Nord"]+c["NordEst"]>=5);
   (c["NordEst"]+c["Est"]+c["SudEst"]>=5);
   (c["SudEst"]+c["Sud"]+c["SudOuest"]>=5);
   (c["NordOuest"]+c["Ouest"]+c["SudOuest"]>=5);


  
   
}

execute{
     write(c["NordOuest"]);
     write(c["Nord"]);
     write(c["NordEst"]);
     writeln();
     write(c["Ouest"]);
     write(" ");
     write(c["Est"]);
     writeln();
     write(c["SudOuest"]);
     write(c["Sud"]);
     write(c["SudEst"]);

      writeln();    
  
}



main{
  
  thisOplModel.generate();
  cp.startNewSearch(); 
  var i = 0;
  while(cp.next()){ 
       writeln("Solution N° ",i);
       thisOplModel.postProcess();
     
    i +=1;
   }
   writeln("Nombre de solutions :",i);
}
