import 'package:flutter/material.dart';

import 'package:rpg_game/screens/home/home.dart';
import 'package:rpg_game/theme.dart';

void main() {
  runApp( MaterialApp(
    theme: primaryTheme,
    home: const Home(),
  ));
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("My SandBox"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(18),
         child: const Text("My SandBox Page")

      )

    );
  }
}
