/*********************************************
 * Modèle pour le problème des n-reines
 *********************************************/
using CP;

/*** Données du problème  ***/

int taille = ...;
range n = 1..taille;
dvar int plateau[n] in n;

int indices[i in n] = i;

execute{
    var tmp = taille/2;
    if(taille%2==1){
       tmp = tmp - 0.5 ;
    }
     
  var decrease = true;
  for(var i in n){
    if(decrease==true){
       indices[i] = tmp;
       tmp--;
       if(tmp==0){
         decrease = false;
         if(taille%2==0){
               tmp ++;
         }
       }
    }
    else{
       indices[i] = tmp;
       tmp++;

    }

  } 
    write(indices);


}

execute{
      cp.param.searchType = "DepthFirst";
      cp.param.workers = 1;
      var f = cp.factory;
      cp.setSearchPhases(f.searchPhase(plateau,f.selectSmallest(f.explicitVarEval(plateau,indices)),f.selectSmallest(f.value()))
     );
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
//main.mod
include "main.mod";
