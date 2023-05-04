import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_android_app/modules/auth/auth_view_model.dart';
import 'package:weather_android_app/modules/auth/register/entity/user_hive.dart';

class RegisterPresenter {
  RegisterPresenter({required this.viewModel});

  AuthViewModel viewModel;
  
  bool isRegister = false;

  Future<bool> registerUserHive(UserHive user) async {
    final box = await Hive.openBox<UserHive>('users');

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
