import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_autenticacion/controllers/sesion_controller.dart';
import 'package:go_router_autenticacion/models/auth_model.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Autenticacion auth = ref.watch(sesionControllerProvider);

    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        if (auth is Comprobando)
          if (auth.comprobando.isLoading) ...[
            const Row(),
            const Text("Splash screen 😎😎😎"),
            const SizedBox(
              height: 10,
            ),
            const CircularProgressIndicator()
          ] else if (auth.comprobando.hasError)
            Text(
              "Pincho! ${auth.comprobando.asError?.error}",
            ),
      ]),
    );
  }
}
