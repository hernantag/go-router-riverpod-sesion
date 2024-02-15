import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_autenticacion/providers/random_names_provider.dart';

class NombresScreen extends ConsumerWidget {
  const NombresScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Nombres!"),
        ),
        body: ref.watch(listaNombresProvider).when(
              data: (data) => ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) =>
                    ListTile(title: Text(data[index])),
              ),
              error: (error, stackTrace) => const Text("Ups!!!"),
              loading: () => const Center(child: CircularProgressIndicator()),
            ));
  }
}
