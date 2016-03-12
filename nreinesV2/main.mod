/*********************************************
 * Modèle pour le problème des n-reines
 *********************************************/
using CP;

/*** Données du problème  ***/
int taille = 8;
range n = 1..taille;
// Variables du domaine
dvar int matrice[n][n] in 0..1;




execute{
   cp.param.searchType = "DepthFirst";
   cp.param.workers = 1;
    
}

minimize
     sum(i in n) sum(j in n) matrice[i][j];
      



subject to{
            
      forall(j in n ){
          forall(i in n ){
              
             (sum(w in n) matrice[j][w] ==1)  ||(sum(p in n) matrice[p][i] ==1) || (sum(k in n) sum(z in n : abs(j-k) == abs(i-z)) matrice[k][z]) ==1;

               
           }
      } 
      

/*
Depth first :

! ----------------------------------------------------------------------------
 ! Search terminated normally, 1 solution found.
 ! Best objective         : 5 (optimal - effective tol. is 0)
 ! Number of branches     : 491,610
 ! Number of fails        : 245,805
 ! Total memory usage     : 1.7 MB (1.3 MB CP Optimizer + 0.4 MB Concert)
 ! Time spent in solve    : 12.70s (12.68s engine + 0.01s extraction)
 ! Search speed (br. / s) : 38,770.5
 ! ----------------------------------------------------------------------------

<<< solve


OBJECTIVE: 5
Matrice [[0 0 1 0 0 0 0 0]
         [0 1 0 0 0 0 0 0]
         [1 0 0 0 0 0 0 0]
         [0 0 0 0 0 0 0 0]
         [0 0 0 0 0 0 0 0]
         [0 0 0 0 0 0 0 0]
         [0 0 0 0 0 0 0 1]
         [0 0 0 0 0 0 1 0]]
<<< post process



*/

        
}

execute{
   write("Matrice", matrice)
}
