// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchViewModel on _SearchViewModel, Store {
  late final _$statesHistoryAtom =
      Atom(name: '_SearchViewModel.statesHistory', context: context);

  @override
  List<String> get statesHistory {
    _$statesHistoryAtom.reportRead();
    return super.statesHistory;
  }

  @override
  set statesHistory(List<String> value) {
    _$statesHistoryAtom.reportWrite(value, super.statesHistory, () {
      super.statesHistory = value;
    });
  }

  late final _$errorTxtAtom =
      Atom(name: '_SearchViewModel.errorTxt', context: context);

  @override
  String? get errorTxt {
    _$errorTxtAtom.reportRead();
    return super.errorTxt;
  }

  @override
  set errorTxt(String? value) {
    _$errorTxtAtom.reportWrite(value, super.errorTxt, () {
      super.errorTxt = value;
    });
  }

  late final _$searchControllerAtom =
      Atom(name: '_SearchViewModel.searchController', context: context);

  @override
  TextEditingController get searchController {
    _$searchControllerAtom.reportRead();
    return super.searchController;
  }

  @override
  set searchController(TextEditingController value) {
    _$searchControllerAtom.reportWrite(value, super.searchController, () {
      super.searchController = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_SearchViewModel.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isFocusedAtom =
      Atom(name: '_SearchViewModel.isFocused', context: context);

  @override
  bool get isFocused {
    _$isFocusedAtom.reportRead();
    return super.isFocused;
  }

  @override
  set isFocused(bool value) {
    _$isFocusedAtom.reportWrite(value, super.isFocused, () {
      super.isFocused = value;
    });
  }

  late final _$buttonPressedAsyncAction =
      AsyncAction('_SearchViewModel.buttonPressed', context: context);

  @override
  Future buttonPressed() {
    return _$buttonPressedAsyncAction.run(() => super.buttonPressed());
  }

  @override
  String toString() {
    return '''
statesHistory: ${statesHistory},
errorTxt: ${errorTxt},
searchController: ${searchController},
isLoading: ${isLoading},
isFocused: ${isFocused}
    ''';
  }
}
