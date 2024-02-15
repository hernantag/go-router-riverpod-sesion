import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_autenticacion/controllers/sesion_controller.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: ref.read(sesionControllerProvider.notifier).login,
              child: const Text("Logueate jeej"))),
    );
  }
}
