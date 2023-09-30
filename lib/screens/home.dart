import 'package:best_calculator/screens/history.dart';
import 'package:flutter/material.dart';
import '../widgets/keyBoard.dart';
import '../widgets/output.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

    return Scaffold(
      // drawer: ,
      backgroundColor: Color.fromRGBO(44, 44, 44, 1),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
              return const HistotyScreen();
            })),
            icon: const Icon(Icons.history_rounded),
            // the splash radius is for the raduis of the effect of the icon button
            splashRadius: 20,
          )
        ],
      ),
      body: Stack(children: [
        Positioned(
          right: -90,
          bottom: 50,
          child: Container(
            height: 550,
            width: 200,
            decoration: const BoxDecoration(
                color: Color.fromARGB(108, 0, 0, 0),
                // border: Border.all(),
                borderRadius: BorderRadius.all(Radius.circular(100))),
          ),
        ),
        const Column(children: [Output(), keyboard()])
      ]),
    );
  }
}
