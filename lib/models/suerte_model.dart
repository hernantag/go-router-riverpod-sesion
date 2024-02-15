abstract class SuerteModel {
  factory SuerteModel.suertudo() = _Suertudo;
  factory SuerteModel.sinSuerte() = _SinSuerte;

  bool get tuvoSuerte {
    switch (this) {
      case _Suertudo():
        return true;
      default:
        return false;
    }
  }

  SuerteModel._();
}

class _Suertudo extends SuerteModel {
  _Suertudo() : super._();
}

class _SinSuerte extends SuerteModel {
  _SinSuerte() : super._();
}
