import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_autenticacion/controllers/sesion_controller.dart';
import 'package:go_router_autenticacion/models/auth_model.dart';
import 'package:go_router_autenticacion/router/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  ValueNotifier<Authentication> authStateListener =
      ValueNotifier(Authentication.checking(val: const AsyncLoading()));

  ref.listen(
    sesionControllerProvider.select((value) => value),
    (prev, next) => authStateListener.value = next,
  );

  final rutas = GoRouter(
    refreshListenable: authStateListener,
    routes: $appRoutes,
    redirect: (context, state) {
      final Authentication authState = authStateListener.value;

      if (authState.currentlyChecking || authState.hasCheckingError) {
        return const SplashRoute().location;
      }

      bool isAuthenticated = authStateListener.value.isAuthenticated;

      if (!isAuthenticated) return const LoginRoute().location;

      if (state.location == const LoginRoute().location && isAuthenticated) {
        return const HomeRoute().location;
      }
      if (state.location == const SplashRoute().location && isAuthenticated) {
        return const HomeRoute().location;
      }

      return null;
    },
  );

  return rutas;
}
