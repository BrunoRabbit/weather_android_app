import 'package:mobx/mobx.dart';
part 'rain_view_model.g.dart';

class RainViewModel = _RainViewModel with _$RainViewModel;

abstract class _RainViewModel with Store {
  @observable
  List<int>? humidityList = [];
}
