// ignore_for_file: depend_on_referenced_packages

import 'package:hive/hive.dart';
import 'package:weather_android_app/modules/auth/auth_store.dart';
import 'package:weather_android_app/modules/auth/register/entity/user_hive.dart';
import 'package:weather_android_app/modules/auth/register/presenter/register_presenter.dart';
import 'package:collection/collection.dart';

class LoginPresenter extends RegisterPresenter {
  LoginPresenter({required super.viewModel});
  AuthStore authStore = AuthStore();

  Future<void> loginUser(UserHive user) async {
    final box = await Hive.openBox<UserHive>('users');

    final userCredentials = box.values.firstWhereOrNull(
      (u) => u.email == user.email && u.password == user.password,
    );

    if (userCredentials != null) {
      await authStore.login();
      viewModel.errorText = "Redirecionando, por favor aguarde!";
    } else {
      await authStore.logout();
      viewModel.errorText = "Email ou senha incorretos!";
    }

    await box.close();

    viewModel.userHive = userCredentials;
  }
}
