import 'dart:math';

import 'package:go_router_autenticacion/models/auth_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sesion_controller.g.dart';

@riverpod
class SesionController extends _$SesionController {
  @override
  Autenticacion build() {
    recuperarVariablesRemotas();
    return Autenticacion.comprobando(val: const AsyncLoading());
  }

  void login() {
    state = Autenticacion.logueado();
  }

  void logout() {
    state = Autenticacion.deslogueado();
  }

  Future<void> recuperarVariablesRemotas() async {
    await Future.delayed(const Duration(seconds: 3));
    final Random randomGenerator = Random();
    final int randomNumber = randomGenerator.nextInt(100);
    if (randomNumber > 50) {
      state = Autenticacion.comprobando(val: const AsyncData(1));
    } else {
      state = Autenticacion.comprobando(
          val: AsyncError(Exception("Error random!"), StackTrace.current));
    }
  }
}
