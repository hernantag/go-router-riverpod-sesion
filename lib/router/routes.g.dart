// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
      $loginRoute,
      $nombresRoute,
      $spalshRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      name: 'inicio',
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'suertudo',
          name: 'suertudo',
          factory: $SuertudoRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'mala-suerte',
          name: 'mala-suerte',
          factory: $MalaSuerteRouteExtension._fromState,
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SuertudoRouteExtension on SuertudoRoute {
  static SuertudoRoute _fromState(GoRouterState state) => const SuertudoRoute();

  String get location => GoRouteData.$location(
        '/suertudo',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MalaSuerteRouteExtension on MalaSuerteRoute {
  static MalaSuerteRoute _fromState(GoRouterState state) =>
      const MalaSuerteRoute();

  String get location => GoRouteData.$location(
        '/mala-suerte',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute => GoRouteData.$route(
      path: '/login',
      name: 'login',
      factory: $LoginRouteExtension._fromState,
    );

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $nombresRoute => GoRouteData.$route(
      path: '/nombres',
      name: 'nombres',
      factory: $NombresRouteExtension._fromState,
    );

extension $NombresRouteExtension on NombresRoute {
  static NombresRoute _fromState(GoRouterState state) => const NombresRoute();

  String get location => GoRouteData.$location(
        '/nombres',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $spalshRoute => GoRouteData.$route(
      path: '/splash',
      factory: $SpalshRouteExtension._fromState,
    );

extension $SpalshRouteExtension on SpalshRoute {
  static SpalshRoute _fromState(GoRouterState state) => const SpalshRoute();

  String get location => GoRouteData.$location(
        '/splash',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
