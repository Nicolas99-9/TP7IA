/*********************************************
 * Modèle pour le problème des n-reines
 *********************************************/
using CP;

/*** Données du problème  ***/

int taille = ...;
range n = 1..taille;
dvar int plateau[n] in n;

// plateau[5] correspond à la colonne de la 5 eme ligne du plateau de jeu


execute{
   cp.param.searchType = "DepthFirst";
   cp.param.workers = 1;
}
// TODO
constraints{
	forall(i,j in n : i<j  ){
		   plateau[i] != plateau[j];
                   abs(plateau[i]-plateau[j]) != abs(i-j);
	} 
}

execute{
    for(var j in  n){
      for(var i in n){
           if(plateau[j] == i){
                 write(1);
            }
            else{
                 write(0);

            }
        }
      writeln();
   }
        

}

include "main.mod";
