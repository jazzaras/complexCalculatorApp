import 'package:best_calculator/providers/answerProvider.dart';
import 'package:best_calculator/providers/equation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Output extends ConsumerWidget {
  const Output({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // List off all elements in the String that is going to be calculated
    List<String> listOfAllElementsOfEquation =
        ref.watch(equationProvider).split(" ");
    final operators = ["+", "×", "÷", "-"];

    // using RichText will enable us to create a text widget with multiple colors... in out case every elements color is derived dinamclly
    Widget finalColoredOutput = RichText(
        text: TextSpan(
            style: const TextStyle(
                fontSize: 26,
                fontFamily: "Courgette",
                fontWeight: FontWeight.w300),
            children: [
          const TextSpan(text: "    "),
          ...listOfAllElementsOfEquation.map((e) {
            if (operators.contains(e)) {
              return TextSpan(
                  text: " $e ",
                  style: const TextStyle(
                      color: Color.fromARGB(255, 248, 113, 103)));
            } else {
              return TextSpan(
                  text: e, style: const TextStyle(color: Colors.white));
            }
          }),
          TextSpan(
              style: TextStyle(color: Colors.white),
              text: ((ref.watch(equationProvider.notifier).isTyping == false)
                  ? " = "
                  : "")),
        ]));

    return Container(
        height: 220,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FittedBox(child: finalColoredOutput),
            const SizedBox(height: 5),
            Text(
              ref.watch(answerProvider),
              style: const TextStyle(
                  fontSize: 75,
                  color: Colors.white,
                  fontFamily: "Courgette",
                  fontWeight: FontWeight.w200),
            ),
          ],
        ));
  }
}
