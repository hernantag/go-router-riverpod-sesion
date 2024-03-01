import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_autenticacion/models/user_model.dart';

abstract class Authentication {
  factory Authentication.authenticated({required UserModel user}) =
      _Authenticated;
  factory Authentication.notAuthenticated() = _NotAuthenticated;
  factory Authentication.checking({required AsyncValue val}) {
    return _Checking(estado: val);
  }

  bool get isAuthenticated {
    switch (this) {
      case _Authenticated():
        return true;
      default:
        return false;
    }
  }

  bool get currentlyChecking {
    if (this is _Checking && (this as _Checking).estado.isLoading) {
      return true;
    } else {
      return false;
    }
  }

  bool get hasCheckingError {
    if (this is _Checking && (this as _Checking).estado.hasError) {
      return true;
    } else {
      return false;
    }
  }

  UserModel? get usuario {
    if (isAuthenticated) {
      return (this as _Authenticated).user;
    } else {
      return null;
    }
  }

  Authentication._();
}

class _Authenticated extends Authentication {
  _Authenticated({required this.user}) : super._();

  final UserModel user;
}

class _NotAuthenticated extends Authentication {
  _NotAuthenticated() : super._();
}

class _Checking extends Authentication {
  _Checking({required this.estado}) : super._();

  final AsyncValue estado;
}
