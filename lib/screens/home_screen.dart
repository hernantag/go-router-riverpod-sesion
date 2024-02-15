import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_autenticacion/controllers/sesion_controller.dart';
import 'package:go_router_autenticacion/router/routes.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
            child: ElevatedButton(
                onPressed: () {
                  const NombresRoute().push(context);
                },
                child: const Text("Nombres!!"))),
        Center(
            child: ElevatedButton(
                onPressed: ref.read(sesionControllerProvider.notifier).logout,
                child: const Text("Logout"))),
      ]),
    );
  }
}
