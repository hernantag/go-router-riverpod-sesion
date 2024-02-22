import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_autenticacion/models/user_model.dart';

abstract class Autenticacion {
  factory Autenticacion.logueado({required UsuarioModel user}) = _Autenticado;
  factory Autenticacion.deslogueado() = _NoAutenticado;
  factory Autenticacion.comprobando({required AsyncValue val}) {
    return _Comprobando(estado: val);
  }

  bool get autenticado {
    switch (this) {
      case _Autenticado():
        return true;
      default:
        return false;
    }
  }

  bool get comprobando {
    if (this is _Comprobando && (this as _Comprobando).estado.isLoading) {
      return true;
    } else {
      return false;
    }
  }

  bool get errorComprobacion {
    if (this is _Comprobando && (this as _Comprobando).estado.hasError) {
      return true;
    } else {
      return false;
    }
  }

  UsuarioModel? get usuario {
    if (autenticado) {
      return (this as _Autenticado).user;
    } else {
      return null;
    }
  }

  Autenticacion._();
}

class _Autenticado extends Autenticacion {
  _Autenticado({required this.user}) : super._();

  final UsuarioModel user;
}

class _NoAutenticado extends Autenticacion {
  _NoAutenticado() : super._();
}

class _Comprobando extends Autenticacion {
  _Comprobando({required this.estado}) : super._();

  final AsyncValue estado;
}
