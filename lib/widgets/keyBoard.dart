import 'package:best_calculator/widgets/calculatorButton.dart';
import 'package:flutter/material.dart';

class keyboard extends StatelessWidget {
  const keyboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: GridView.count(
          primary: false,
          mainAxisSpacing: 25,
          crossAxisSpacing: 25,
          crossAxisCount: 4,
          padding: const EdgeInsets.only(right: 10, left: 10, top: 15),
          children: [
            calculatorButton("C"),
            calculatorButton("( )"),
            calculatorButton(""),
            calculatorButton("÷"),
            calculatorButton("7"),
            calculatorButton("8"),
            calculatorButton("9"),
            calculatorButton("×"),
            calculatorButton("4"),
            calculatorButton("5"),
            calculatorButton("6"),
            calculatorButton("-"),
            calculatorButton("1"),
            calculatorButton("2"),
            calculatorButton("3"),
            calculatorButton("+"),
            calculatorButton(""),
            calculatorButton("0"),
            calculatorButton("."),
            calculatorButton("="),
          ],
        ),
      ),
    );
  }
}
