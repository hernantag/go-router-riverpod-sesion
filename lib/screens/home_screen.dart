import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_autenticacion/controllers/sesion_controller.dart';
import 'package:go_router_autenticacion/models/user_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserModel? user = ref.watch(sesionControllerProvider).usuario;

    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("${user?.nombre}"),
        Center(
            child: ElevatedButton(
                onPressed: ref.read(sesionControllerProvider.notifier).logout,
                child: const Text("Logout"))),
      ]),
    );
  }
}
