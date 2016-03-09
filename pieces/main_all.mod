/*********************************************
Modèle simple permettant de trouver une solution
*********************************************/
using CP;



{int} pieces = {1,2,5,10,20,50}; // valeurs des differentes pieces
range val = 1..100;


int max_value = 15;
// Modele du problème
// une ligne associe le nombre de pièces necessaires pour faire une valeur 
dvar int obj[val][pieces] in 0..max_value ;

// nombre de pieces de 1 ... 50 pour faire toutes les valeurs
dvar int nb_pieces[pieces] in 0..max_value;

//----- Parametrage Solveur -----
execute{
   //cp.param.searchType = "DepthFirst";
   cp.param.workers = 1;
}


minimize
         sum(i in pieces) nb_pieces[i];  //minimiser le nombre de pièces à utiliser
    


subject to{
      forall(var in val){
            forall(nb in pieces){
                nb_pieces[nb]>= obj[var][nb];
             }
        sum(i in pieces) (obj[var][i]*i) ==  var;  // chercher la valeur voulue
      }
}


execute{  
   write("Nombre de pièces prises = ", obj,"\n");
   write("Nombre de pieces par valeur ",nb_pieces);
}

 

// renvoie une des solutions optimales
