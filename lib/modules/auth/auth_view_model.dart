// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:weather_android_app/modules/auth/register/entity/user_hive.dart';

part 'auth_view_model.g.dart';

class AuthViewModel = _AuthViewModel with _$AuthViewModel;

abstract class _AuthViewModel with Store {
  @observable
  String errorText = "";

  @observable
  UserHive? userHive;
}