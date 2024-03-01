import 'package:flutter/material.dart';
import 'package:go_router_autenticacion/models/auth_model.dart';
import 'package:go_router_autenticacion/models/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'sesion_controller.g.dart';

@riverpod
class SesionController extends _$SesionController {
  @override
  Authentication build() {
    restoreSession();
    return Authentication.checking(val: const AsyncLoading());
  }

  void login() async {
    final SharedPreferences instance = await SharedPreferences.getInstance();

    const String fakeToken = "HELLOWORLD";

    instance.setString("token", fakeToken);

    final UserModel user = await getUser(fakeToken);

    state = Authentication.authenticated(user: user);
  }

  void logout() async {
    final SharedPreferences instance = await SharedPreferences.getInstance();
    instance.clear();
    state = Authentication.notAuthenticated();
  }

  void restoreSession() async {
    await Future.delayed(const Duration(seconds: 3));

    final SharedPreferences instance = await SharedPreferences.getInstance();

    final bool tokenExists = instance.containsKey("token");

    if (!tokenExists) {
      state = Authentication.notAuthenticated();
      return;
    }

    final String? token = instance.getString("token");
    final UserModel user = await getUser(token!);

    state = Authentication.authenticated(user: user);
  }
}

Future<UserModel> getUser(String token) async {
  await Future.delayed(Durations.extralong4);
  return UserModel(id: 1, nombre: "Hernan");
}
