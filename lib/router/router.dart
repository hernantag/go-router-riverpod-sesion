import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_autenticacion/controllers/sesion_controller.dart';
import 'package:go_router_autenticacion/models/auth_model.dart';
import 'package:go_router_autenticacion/router/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  ValueNotifier<Autenticacion> estadoAutenticacion =
      ValueNotifier(Autenticacion.comprobando(val: const AsyncLoading()));

  ref.listen(
    sesionControllerProvider.select((value) => value),
    (prev, next) => estadoAutenticacion.value = next,
  );

  final rutas = GoRouter(
    refreshListenable: estadoAutenticacion,
    routes: $appRoutes,
    redirect: (context, state) {
      final Autenticacion authState = estadoAutenticacion.value;

      if (authState.comprobando || authState.errorComprobacion) {
        return const SpalshRoute().location;
      }

      bool autenticado = estadoAutenticacion.value.autenticado;

      if (!autenticado) return const LoginRoute().location;

      if (state.location == const LoginRoute().location && autenticado) {
        return const HomeRoute().location;
      }
      if (state.location == const SpalshRoute().location && autenticado) {
        return const HomeRoute().location;
      }

      return null;
    },
  );

  return rutas;
}
