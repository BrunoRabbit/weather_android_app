// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModel with _$SplashViewModel;

abstract class _SplashViewModel with Store {
  @observable
  int currentIndex = 0;

  @observable
  PageController pageController = PageController(initialPage: 0);

  @action
  void onPageChanged(int newIndex) {
    currentIndex = newIndex;
  }

  @action
  void onDotClicked(int newIndex) {
    pageController.animateToPage(
      newIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @action
  void skipToPage() {
    pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.fastOutSlowIn,
    );
  }
}
