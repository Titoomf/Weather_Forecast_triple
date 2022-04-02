// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WeatherController on WeatherControllerBase, Store {
  final _$cityAtom = Atom(name: 'WeatherControllerBase.city');

  @override
  String get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  final _$modelAtom = Atom(name: 'WeatherControllerBase.model');

  @override
  WeatherModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(WeatherModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  final _$getClimaRepositoryAsyncAction =
      AsyncAction('WeatherControllerBase.getClimaRepository');

  @override
  Future<void> getClimaRepository() {
    return _$getClimaRepositoryAsyncAction
        .run(() => super.getClimaRepository());
  }

  @override
  String toString() {
    return '''
city: ${city},
model: ${model}
    ''';
  }
}
