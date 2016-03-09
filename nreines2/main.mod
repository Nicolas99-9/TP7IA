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
   write("Solve time : ", cp.info.solveTime , "\n");
   write("Number of fails : ", cp.info.numberOfFails , "\n");
}
