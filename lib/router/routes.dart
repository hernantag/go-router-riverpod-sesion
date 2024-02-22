import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_autenticacion/screens/home_screen.dart';
import 'package:go_router_autenticacion/screens/login_screen.dart';
import 'package:go_router_autenticacion/screens/splash_screen.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
  name: "inicio",
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

@TypedGoRoute<LoginRoute>(path: "/login", name: "login")
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, state) => const LoginScreen();
}

@TypedGoRoute<SpalshRoute>(path: "/splash")
class SpalshRoute extends GoRouteData {
  const SpalshRoute();

  @override
  Widget build(BuildContext context, state) => const SplashScreen();
}
