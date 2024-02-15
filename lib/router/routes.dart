import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_autenticacion/models/suerte_model.dart';
import 'package:go_router_autenticacion/providers/random_suerte_provider.dart';
import 'package:go_router_autenticacion/screens/home_screen.dart';
import 'package:go_router_autenticacion/screens/login_screen.dart';
import 'package:go_router_autenticacion/screens/mala_suerte_screen.dart';
import 'package:go_router_autenticacion/screens/nombres_screen.dart';
import 'package:go_router_autenticacion/screens/splash_screen.dart';
import 'package:go_router_autenticacion/screens/suertudo_screen.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(path: '/', name: "inicio", routes: [
  TypedGoRoute<SuertudoRoute>(name: "suertudo", path: "suertudo"),
  TypedGoRoute<MalaSuerteRoute>(name: "mala-suerte", path: "mala-suerte"),
])
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    SuerteModel suerte =
        ProviderScope.containerOf(context).read(suerteProvider);

    if (suerte.tuvoSuerte) {
      return const SuertudoRoute().location;
    }

    return super.redirect(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

@TypedGoRoute<LoginRoute>(path: "/login", name: "login")
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, state) => const LoginScreen();
}

@TypedGoRoute<NombresRoute>(path: "/nombres", name: "nombres")
class NombresRoute extends GoRouteData {
  const NombresRoute();

  @override
  Widget build(BuildContext context, state) => const NombresScreen();
}

class SuertudoRoute extends GoRouteData {
  const SuertudoRoute();

  @override
  Widget build(BuildContext context, state) => const SuertudoScreen();
}

class MalaSuerteRoute extends GoRouteData {
  const MalaSuerteRoute();

  @override
  Widget build(BuildContext context, state) => const MalaSuerteScreen();
}

@TypedGoRoute<SpalshRoute>(path: "/splash")
class SpalshRoute extends GoRouteData {
  const SpalshRoute();

  @override
  Widget build(BuildContext context, state) => const SplashScreen();
}
