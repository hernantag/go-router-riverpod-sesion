import 'package:flutter/material.dart';

class MalaSuerteScreen extends StatelessWidget {
  const MalaSuerteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mala suerte :(")),
      body: const Column(children: [
        Center(
          child: Text(
            "Esta pantalla te trae mala suerte (no mueras porfas)",
          ),
        )
      ]),
    );
  }
}
