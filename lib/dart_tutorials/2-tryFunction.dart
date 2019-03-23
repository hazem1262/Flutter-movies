typedef IntCalculation =  Function(int, int);
void main() {
  var firstNum = 2;
  var secondNum = 5;

  Function add = (int firstNum, int secondNumber){
    return firstNum + secondNumber;
  };
  IntCalculation sub = (int firstNum, int secondNumber){
    return firstNum - secondNumber;
  };
  IntCalculation mul = (int firstNum, int secondNumber){
    return firstNum * secondNumber;
  };
  IntCalculation div = (int firstNum, int secondNumber){
    return firstNum / secondNumber;
  };

  calc(firstNum, secondNum, add);
  calc(firstNum, secondNum, sub);
  calc(firstNum, secondNum, mul);
  calc(firstNum, secondNum, div);
}

// higher order function : function that accept function as a parameter

calc(int firstNum, int secondNumber, IntCalculation cal){
  print (cal(firstNum, secondNumber));
}