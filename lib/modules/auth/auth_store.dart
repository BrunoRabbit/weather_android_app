import 'package:hive/hive.dart';

class AuthStore {
  static final AuthStore _instance = AuthStore._internal();

  factory AuthStore() {
    return _instance;
  }

  AuthStore._internal();

  bool isLoggedIn = false;

  Future<void> login() async {
    final box = await Hive.openBox<bool>('userAuth');
    isLoggedIn = true;
    box.put('isLoggedIn', true);
  }

  Future<void> logout() async {
    final box = await Hive.openBox<bool>('userAuth');
    isLoggedIn = false;
    box.put('isLoggedIn', false);
  }
}
