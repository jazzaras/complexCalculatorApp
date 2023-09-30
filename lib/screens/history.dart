import 'package:best_calculator/providers/historyProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistotyScreen extends ConsumerWidget {
  const HistotyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;

    List historyCalculations = ref.watch(historyPorvider);
    Widget emptyState = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "No Past Calculations...",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Courgette",
                fontSize: size.width / 20),
          ),
          Icon(
            Icons.calculate,
            color: Colors.white,
            size: (size.height + size.width) / 10,
          )
        ],
      ),
    );
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Color.fromRGBO(44, 44, 44, 1),
        body: (historyCalculations.isEmpty)
            ? emptyState
            : ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                children: ListTile.divideTiles(
                    context: context,
                    color: Colors.black,
                    tiles: historyCalculations.map((element) {
                      return ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          tileColor: Color.fromARGB(255, 219, 219, 219),
                          title: Text(
                            "${element[0]} = ",
                            style: const TextStyle(
                                fontFamily: "Courgette", fontSize: 25),
                          ),
                          subtitle: Text(
                            element[1],
                            style: const TextStyle(
                                fontFamily: "Courgette", fontSize: 20),
                          ),
                          trailing: IconButton(
                            onPressed: () => ref
                                .read(historyPorvider.notifier)
                                .remove(element),
                            icon: const Icon(Icons.delete),
                            splashRadius: 20,
                          ));
                    })).toList(),
              ));
  }
}
