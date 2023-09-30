import 'package:flutter_riverpod/flutter_riverpod.dart';

class Histroy extends StateNotifier<List<List<String>>> {
  Histroy() : super([]);

  void add(String eq, String ans) {
    state = [
      ...state,
      [eq, ans]
    ];
  }

  void remove(List li) {
    state = state = state.where((element) => element != li).toList();
  }
}

final historyPorvider =
    StateNotifierProvider<Histroy, List<List<String>>>((ref) {
  return Histroy();
});
