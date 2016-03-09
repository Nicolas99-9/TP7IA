/*********************************************
 * Modèle pour le problème des n-reines
 *********************************************/
using CP;

/*** Données du problème  ***/
range n = 0..8;

// Variables du domaine
dvar int matrice[n][n] in 0..1;
dvar int nb_queens in n;

//faire tableau de N premières valeurs pour les lgines, N suivantes pour les colonnes

execute{
   cp.param.workers = 1;
}

minimize
     sum(i in n) sum(j in n) matrice[i][j];
      



subject to{
             forall(j,k in n : j<k){
                 forall(w,p in n : j<k){
                  matrice[j][w] != matrice[j][p]; // check if line is correct
                  matrice[j][w] != matrice[k][w];
                  abs(matrice[j]-matrice[k]) != abs(matrice[j]-matrice[k]) 
                  
               }
           }
        
}

execute{
   write("Nb queens", nb_queens);
   write("Matrice", matrice)
}

