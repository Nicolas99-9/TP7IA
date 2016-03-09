
main{
  thisOplModel.generate();
  if(cp.solve()){
    var obj = cp.getObjValue();
    thisOplModel.postProcess();

 }

}
