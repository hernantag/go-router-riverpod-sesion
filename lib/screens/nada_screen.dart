import 'package:flutter/material.dart';

class NadaScreen extends StatelessWidget {
  const NadaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nada que hacer")),
      body: Column(children: [
        Center(
          child: Text("En esta pantalla simplemente no pasa nada.. 😐😐😐"),
        )
      ]),
    );
  }
}
