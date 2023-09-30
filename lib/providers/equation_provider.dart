import 'package:best_calculator/models/MyStack.dart';
import 'package:best_calculator/providers/answerProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Equation extends StateNotifier<String> {
  Equation() : super("");

  int Counter = 0;
  bool isTyping = true;
  final operators = ["+", "-", "÷", "×"];

  String paranthasesDisplayed() {
    if (state.endsWith("( -")) {
      print("t");
      return "";
    } else if (state.isEmpty || state.endsWith(" ") || state.endsWith("-")) {
      Counter++;
      return "( ";
    } else {
      if (Counter == 0) {
        Counter++;
        return " × ( ";
      } else {
        Counter--;
        return " )";
      }
    }
  }

  void addElement(String ele) {
    isTyping = true;

    print(state);

    // ele = ele + "";

    if (ele == "( )") {
      ele = paranthasesDisplayed();
    } else if (operators.contains(ele)) {
      if (ele == "-") {
        if ((state.isNotEmpty &&
                state.endsWith(" ") &&
                state[state.length - 2] != "(") ||
            state.endsWith("-")) {
          ele = "";
        } else if (state.isNotEmpty && !state.endsWith(" ")) {
          ele = " $ele ";
        }
      } else if (state.endsWith(" ") || state.isEmpty || state.endsWith("-")) {
        ele = "";
      } else {
        ele = " $ele ";
      }
    } else if (state.endsWith(")")) {
      ele = " × $ele";
    }

    state += ele;
  }

  void clearEquation() {
    isTyping = true;
    Counter = 0;
    state = "";
  }

  calculateEquation(WidgetRef ref) {
    isTyping = false;
    List postfixExpression = _infixToPostfix();
    print(postfixExpression);

    double answer = _evaluatePostfix(postfixExpression);

    ref.read(answerProvider.notifier).changeAnswer(answer.toString());
  }

  int _precedence(String operator) {
    switch (operator) {
      case '+':
      case '-':
        return 1;
      case '×':
      case '÷':
        return 2;
      case '^':
        return 3;
      default:
        return 0;
    }
  }

  List _infixToPostfix() {
    var ListOfElem = state.split(" ");
    List finalString = [];

    myStack stack = myStack();

    for (var op in ListOfElem) {
      if (op == "(") {
        stack.push("(");
      } else if (op == ")") {
        while (stack.peek() != "(") {
          finalString.add(stack.pop());
        }
        stack.pop();
      } else if (operators.contains(op)) {
        if (stack.isEmpty) {
          stack.push(op);
        } else {
          String top = stack.peek();
          if (_precedence(top) >= _precedence(op)) {
            finalString.add(stack.pop());
            stack.push(op);
          } else {
            stack.push(op);
          }
        }
      } else {
        finalString.add(op);
      }
    }

    while (!stack.isEmpty) {
      finalString.add(stack.pop());
    }

    return finalString;
  }

  double _evaluatePostfix(List postfixExpression) {
    myStack<String> stack = myStack();

    // op for oparator / operand
    for (String op in postfixExpression) {
      // if it is not an operator ... it is a oprand.. 1 2 3 4
      if (!operators.contains(op)) {
        stack.push(op);
      } else {
        double secondValue = double.parse(stack.pop());
        double firstValue = double.parse(stack.pop());
        double resualt = _simpleCalculation(firstValue, secondValue, op);

        stack.push(resualt.toString());
      }
    }
    return double.parse(stack.pop());
  }

  double _simpleCalculation(double firstValue, double secondValue, String op) {
    switch (op) {
      case "+":
        return firstValue + secondValue;
      case "-":
        return firstValue - secondValue;
      case "×":
        return firstValue * secondValue;
      case "÷":
        return firstValue / secondValue;
    }

    return 0.0;
  }
}

final equationProvider = StateNotifierProvider<Equation, String>((ref) {
  return Equation();
});
