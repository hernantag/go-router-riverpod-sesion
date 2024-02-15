import 'dart:async';
import 'package:go_router_autenticacion/configs/riverpod_extension.dart';
import 'package:random_name_generator/random_name_generator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'random_names_provider.g.dart';

@riverpod
Future<List<String>> listaNombres(ListaNombresRef ref) async {
  await Future.delayed(const Duration(seconds: 1));

  final List<String> listaNombres = [];

  for (var i = 0; i < 30; i++) {
    listaNombres.add(RandomNames().fullName());
  }

  ref.cacheFor(const Duration(seconds: 10));

  return listaNombres;
}
