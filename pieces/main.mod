/*********************************************
Modèle simple permettant de trouver une solution
*********************************************/
using CP;



{int} pieces = {1,2,5,10,20,50}; // valeurs des differentes pieces


int valeur_voulue = 33;




// Modele du problème
dvar int obj[pieces] in 0..15;


//----- Parametrage Solveur -----
execute{
   //cp.param.searchType = "DepthFirst";
   cp.param.workers = 1;
}


minimize
     sum(i in pieces) obj[i];  //minimiser le nombre de pièces à utiliser
    


subject to{
 sum(i in pieces) (obj[i]*i) ==  valeur_voulue;  // chercher la valeur voulue
 
}


execute{  
   write("Nombre de pièces prises = ", obj);
}

 

main{
  thisOplModel.generate();
  if(cp.solve()){
    var obj = cp.getObjValue();
    thisOplModel.postProcess();
  }
}
