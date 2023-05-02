import 'package:mobx/mobx.dart';

part 'register_view_model.g.dart';

class RegisterViewModel = _RegisterViewModel with _$RegisterViewModel;

abstract class _RegisterViewModel with Store {
  @observable
  String errorText = "";
}
