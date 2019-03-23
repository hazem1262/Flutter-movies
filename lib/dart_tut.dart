class Tut{
  String _st ;
  get st => "dgfhfg";
  tryException(){
    try{
      print(2);
    } catch (e){
      e.handleError();
    }
}
}

class CustomException implements Exception{


  handleError(){

  }
}