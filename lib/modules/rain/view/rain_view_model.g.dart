// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rain_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RainViewModel on _RainViewModel, Store {
  late final _$humidityListAtom =
      Atom(name: '_RainViewModel.humidityList', context: context);

  @override
  List<int>? get humidityList {
    _$humidityListAtom.reportRead();
    return super.humidityList;
  }

  @override
  set humidityList(List<int>? value) {
    _$humidityListAtom.reportWrite(value, super.humidityList, () {
      super.humidityList = value;
    });
  }

  @override
  String toString() {
    return '''
humidityList: ${humidityList}
    ''';
  }
}
