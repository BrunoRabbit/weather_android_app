// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

import 'package:weather_android_app/modules/register/entity/user_hive.dart';
import 'package:weather_android_app/modules/register/view/register_view_model.dart';

class RegisterPresenter {
  RegisterPresenter({required this.viewModel});

  RegisterViewModel viewModel;

  Future<bool> registerUserHive(UserHive user) async {
    final box = await Hive.openBox<UserHive>('users');
    bool isRegister = false;

    if (box.values.any((userHive) => userHive.email == user.email)) {
      isRegister = false;
      viewModel.errorText = 'Já existe um usuário registrado com este email!';
    } else {
      await box.add(user);
      isRegister = true;
      viewModel.errorText = 'Usuário registrado com sucesso!';
    }

    await box.close();

    return isRegister;
  }
}
