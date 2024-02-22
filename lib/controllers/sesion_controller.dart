import 'package:flutter/material.dart';
import 'package:go_router_autenticacion/models/auth_model.dart';
import 'package:go_router_autenticacion/models/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'sesion_controller.g.dart';

@riverpod
class SesionController extends _$SesionController {
  @override
  Autenticacion build() {
    recuperarSesion();
    return Autenticacion.comprobando(val: const AsyncLoading());
  }

  void login() async {
    final SharedPreferences instance = await SharedPreferences.getInstance();

    const String fakeToken = "HELLOWORLD";

    instance.setString("token", fakeToken);

    final UsuarioModel user = await getUser(fakeToken);

    state = Autenticacion.logueado(user: user);
  }

  void logout() async {
    final SharedPreferences instance = await SharedPreferences.getInstance();
    instance.clear();
    state = Autenticacion.deslogueado();
  }

  void recuperarSesion() async {
    await Future.delayed(const Duration(seconds: 3));

    final SharedPreferences instance = await SharedPreferences.getInstance();

    final bool existeToken = instance.containsKey("token");

    if (!existeToken) {
      state = Autenticacion.deslogueado();
      return;
    }

    final String? token = instance.getString("token");
    final UsuarioModel user = await getUser(token!);

    state = Autenticacion.logueado(user: user);
  }
}

Future<UsuarioModel> getUser(String token) async {
  await Future.delayed(Durations.extralong4);
  return UsuarioModel(id: 1, nombre: "Hernan");
}
