import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class Autenticacion {
  factory Autenticacion.logueado() = Autenticado;
  factory Autenticacion.deslogueado() = NoAutenticado;
  factory Autenticacion.comprobando({required AsyncValue val}) {
    return Comprobando(comprobando: val);
  }

  bool get autenticado {
    switch (this) {
      case Autenticado():
        return true;
      default:
        return false;
    }
  }

  Autenticacion._();
}

class Autenticado extends Autenticacion {
  Autenticado() : super._();
}

class NoAutenticado extends Autenticacion {
  NoAutenticado() : super._();
}

class Comprobando extends Autenticacion {
  Comprobando({required this.comprobando}) : super._();

  final AsyncValue comprobando;
}
