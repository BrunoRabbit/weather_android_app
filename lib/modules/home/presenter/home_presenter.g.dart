// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_presenter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePresenter on _HomePresenter, Store {
  late final _$userLocationAtom =
      Atom(name: '_HomePresenter.userLocation', context: context);

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

  late final _$getUserLocationDataAsyncAction =
      AsyncAction('_HomePresenter.getUserLocationData', context: context);

  @override
  Future<UserLocation> getUserLocationData(UserLatLong entity) {
    return _$getUserLocationDataAsyncAction
        .run(() => super.getUserLocationData(entity));
  }

  @override
  String toString() {
    return '''
userLocation: ${userLocation}
    ''';
  }
}
