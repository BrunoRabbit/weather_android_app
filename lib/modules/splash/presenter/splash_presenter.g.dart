// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_presenter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashPresenter on _SplashPresenter, Store {
  late final _$currentIndexAtom =
      Atom(name: '_SplashPresenter.currentIndex', context: context);

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

  late final _$_SplashPresenterActionController =
      ActionController(name: '_SplashPresenter', context: context);

  @override
  dynamic changeIndex(int newIndex) {
    final _$actionInfo = _$_SplashPresenterActionController.startAction(
        name: '_SplashPresenter.changeIndex');
    try {
      return super.changeIndex(newIndex);
    } finally {
      _$_SplashPresenterActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex}
    ''';
  }
}
