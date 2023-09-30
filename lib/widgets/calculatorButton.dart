import 'package:best_calculator/providers/answerProvider.dart';
import 'package:best_calculator/providers/equation_provider.dart';
import 'package:best_calculator/providers/historyProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class calculatorButton extends ConsumerWidget {
  calculatorButton(this.symboll, {super.key});

  final String symboll;
  final operators = ["+", "×", "÷", "-"];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PhysicalModel(
      color: Colors.black,
      elevation: 11.0,
      shape: BoxShape.circle,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              elevation: 0,
              backgroundColor: (symboll != "=")
                  ? const Color.fromRGBO(53, 53, 53, 1)
                  : const Color.fromRGBO(255, 97, 97, 1)),
          onPressed: () {
            if (symboll == "=") {
              var isTyping = ref.read(equationProvider.notifier).isTyping;
              ref.read(equationProvider.notifier).calculateEquation(ref);
              String eq = ref.read(equationProvider);
              String ans = ref.read(answerProvider);
              if (isTyping) {
                ref.read(historyPorvider.notifier).add(eq, ans);
              }
            } else if (operators.contains(symboll)) {
              ref.read(equationProvider.notifier).addElement(symboll);
            } else if (symboll == "C") {
              ref.read(equationProvider.notifier).clearEquation();
              ref.read(answerProvider.notifier).clear();
            } else if (symboll == "( )") {
              // String toAddElement = ParanthasesDisplayed(ref);
              ref.read(equationProvider.notifier).addElement("( )");
            } else {
              ref.read(equationProvider.notifier).addElement(symboll);
            }
          },
          child: Text(
            symboll,
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: (symboll == "C") ? Colors.red : Colors.white),
          )),
    );
  }
}
