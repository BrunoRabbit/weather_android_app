// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

part 'visibility_presenter.g.dart';

class VisibilityPresenter = _VisibilityPresenter with _$VisibilityPresenter;

abstract class _VisibilityPresenter with Store {
  @observable
  int currentIndex = 0;

  @action
  changeIndex(int newIndex){
    currentIndex = newIndex;
  }
}