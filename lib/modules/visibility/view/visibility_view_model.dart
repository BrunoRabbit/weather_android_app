// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

part 'visibility_view_model.g.dart';

class VisibilityViewModel = _VisibilityViewModel with _$VisibilityViewModel;

abstract class _VisibilityViewModel with Store {
  @observable
  int currentIndex = 0;

  @action
  changeIndex(int newIndex){
    currentIndex = newIndex;
  }
}
