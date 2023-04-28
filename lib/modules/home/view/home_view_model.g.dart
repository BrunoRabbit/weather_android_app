// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModel, Store {
  late final _$isDisplayedDialogAtom =
      Atom(name: '_HomeViewModel.isDisplayedDialog', context: context);

  @override
  bool get isDisplayedDialog {
    _$isDisplayedDialogAtom.reportRead();
    return super.isDisplayedDialog;
  }

  @override
  set isDisplayedDialog(bool value) {
    _$isDisplayedDialogAtom.reportWrite(value, super.isDisplayedDialog, () {
      super.isDisplayedDialog = value;
    });
  }

  late final _$userLocationAtom =
      Atom(name: '_HomeViewModel.userLocation', context: context);

  @override
  UserLocation? get userLocation {
    _$userLocationAtom.reportRead();
    return super.userLocation;
  }

  @override
  set userLocation(UserLocation? value) {
    _$userLocationAtom.reportWrite(value, super.userLocation, () {
      super.userLocation = value;
    });
  }

  @override
  String toString() {
    return '''
isDisplayedDialog: ${isDisplayedDialog},
userLocation: ${userLocation}
    ''';
  }
}
