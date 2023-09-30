import 'package:flutter_riverpod/flutter_riverpod.dart';

class answer extends StateNotifier<String> {
  answer() : super("");

  void changeAnswer(String newAns) {
    /// the next block check if the number does not have fractions... and if it doesn't
    /// it will make it double and then cast to an int (to remove comma) and finally back to a String to store it in the state
    if (double.parse(newAns) % 1 == 0) {
      newAns = (double.parse(newAns).toInt()).toString();
    }
    state = newAns;
  }

  void clear() {
    state = "";
  }
}

final answerProvider = StateNotifierProvider<answer, String>((ref) {
  return answer();
});
