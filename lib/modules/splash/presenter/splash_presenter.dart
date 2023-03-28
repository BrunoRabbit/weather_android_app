
import 'package:mobx/mobx.dart';

part 'splash_presenter.g.dart';

class SplashPresenter = _SplashPresenter with _$SplashPresenter;

abstract class _SplashPresenter with Store {
  @observable
  int currentIndex = 0;

  @action
  changeIndex(int newIndex){
    currentIndex = newIndex;
  }
}
