// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashViewModel on _SplashViewModel, Store {
  late final _$currentIndexAtom =
      Atom(name: '_SplashViewModel.currentIndex', context: context);

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

  late final _$pageControllerAtom =
      Atom(name: '_SplashViewModel.pageController', context: context);

  @override
  PageController get pageController {
    _$pageControllerAtom.reportRead();
    return super.pageController;
  }

  @override
  set pageController(PageController value) {
    _$pageControllerAtom.reportWrite(value, super.pageController, () {
      super.pageController = value;
    });
  }

  late final _$_SplashViewModelActionController =
      ActionController(name: '_SplashViewModel', context: context);

  @override
  void onPageChanged(int newIndex) {
    final _$actionInfo = _$_SplashViewModelActionController.startAction(
        name: '_SplashViewModel.onPageChanged');
    try {
      return super.onPageChanged(newIndex);
    } finally {
      _$_SplashViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onDotClicked(int newIndex) {
    final _$actionInfo = _$_SplashViewModelActionController.startAction(
        name: '_SplashViewModel.onDotClicked');
    try {
      return super.onDotClicked(newIndex);
    } finally {
      _$_SplashViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void skipToPage() {
    final _$actionInfo = _$_SplashViewModelActionController.startAction(
        name: '_SplashViewModel.skipToPage');
    try {
      return super.skipToPage();
    } finally {
      _$_SplashViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
pageController: ${pageController}
    ''';
  }
}
