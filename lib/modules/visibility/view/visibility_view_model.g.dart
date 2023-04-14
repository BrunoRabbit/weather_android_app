// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visibility_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VisibilityViewModel on _VisibilityViewModel, Store {
  late final _$historyAtom =
      Atom(name: '_VisibilityViewModel.history', context: context);

  @override
  List<List<WeatherEntity>> get history {
    _$historyAtom.reportRead();
    return super.history;
  }

  @override
  set history(List<List<WeatherEntity>> value) {
    _$historyAtom.reportWrite(value, super.history, () {
      super.history = value;
    });
  }

  late final _$currentIndexAtom =
      Atom(name: '_VisibilityViewModel.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$dateAtom =
      Atom(name: '_VisibilityViewModel.date', context: context);

  @override
  String get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(String value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  late final _$_VisibilityViewModelActionController =
      ActionController(name: '_VisibilityViewModel', context: context);

  @override
  dynamic changeIndex(int newIndex) {
    final _$actionInfo = _$_VisibilityViewModelActionController.startAction(
        name: '_VisibilityViewModel.changeIndex');
    try {
      return super.changeIndex(newIndex);
    } finally {
      _$_VisibilityViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addItemHistory(WeatherEntity newItem, int index) {
    final _$actionInfo = _$_VisibilityViewModelActionController.startAction(
        name: '_VisibilityViewModel.addItemHistory');
    try {
      return super.addItemHistory(newItem, index);
    } finally {
      _$_VisibilityViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
history: ${history},
currentIndex: ${currentIndex},
date: ${date}
    ''';
  }
}
