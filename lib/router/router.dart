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
      final bool estamosComprobando = estadoAutenticacion.value is Comprobando;

      if (estamosComprobando &&
          ((estadoAutenticacion.value as Comprobando).comprobando.isLoading ||
              (estadoAutenticacion.value as Comprobando)
                  .comprobando
                  .hasError)) {
        return "/splash";
      }

      bool autenticado = estadoAutenticacion.value.autenticado;

      if (!autenticado) return "/login";

      if (state.location == const LoginRoute().location && autenticado) {
        return "/";
      }

      print(state.location);
      print(state.path);
      print(state.pageKey);
      print(state.queryParametersAll);

      return null;
    },
  );

  return rutas;
}
