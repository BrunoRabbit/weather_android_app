// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthViewModel on _AuthViewModel, Store {
  late final _$errorTextAtom =
      Atom(name: '_AuthViewModel.errorText', context: context);

  @override
  String get errorText {
    _$errorTextAtom.reportRead();
    return super.errorText;
  }

  @override
  set errorText(String value) {
    _$errorTextAtom.reportWrite(value, super.errorText, () {
      super.errorText = value;
    });
  }

  late final _$userHiveAtom =
      Atom(name: '_AuthViewModel.userHive', context: context);

  @override
  UserHive? get userHive {
    _$userHiveAtom.reportRead();
    return super.userHive;
  }

  @override
  set userHive(UserHive? value) {
    _$userHiveAtom.reportWrite(value, super.userHive, () {
      super.userHive = value;
    });
  }

  @override
  String toString() {
    return '''
errorText: ${errorText},
userHive: ${userHive}
    ''';
  }
}
