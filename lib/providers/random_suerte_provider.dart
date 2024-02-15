import 'dart:math';
import 'package:go_router_autenticacion/models/suerte_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'random_suerte_provider.g.dart';

@riverpod
SuerteModel suerte(SuerteRef ref) {
  final Random random = Random();

  final int nroRandom = random.nextInt(100);

  return nroRandom > 1 ? SuerteModel.suertudo() : SuerteModel.sinSuerte();
}
