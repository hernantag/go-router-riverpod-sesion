import 'package:flutter/material.dart';

class SuertudoScreen extends StatelessWidget {
  const SuertudoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Que suerte!")),
      body: const Column(children: [
        Center(
          child: Text("Esta pantalla te da 1000 años de buena suerte🙏🍀"),
        )
      ]),
    );
  }
}
