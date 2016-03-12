/*********************************************
 * Modèle pour le problème des n-reines
 *********************************************/
using CP;

/*** Données du problème  ***/
int taille = 7;
range n = 0..taille;
// Variables du domaine
dvar int matrice[n][n] in n;
dvar int plateau[n] in n;



execute{
   cp.param.workers = 1;
    
}

minimize
     sum(i in n) sum(j in n) matrice[i][j];
      



subject to{
            
      forall(j in n ){
          matrice[j][plateau[j]] == 1 ;
      } 
      forall(i,j in n : i<j  ){
		   plateau[i] != plateau[j];
                   abs(plateau[i]-plateau[j]) != abs(i-j);
	} 
      



        
}

execute{
   write("Matrice", matrice)
}
