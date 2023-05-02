import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';

part 'user_hive.g.dart';

@HiveType(typeId: 0)
class UserHive extends HiveObject{
  @HiveField(0)
  String name;

  @HiveField(1)
  String password;

  @HiveField(2)
  String email;

  UserHive({
    required this.name,
    required this.password,
    required this.email,
  });

 static String hashPassword(String password) {
  final privateKey = dotenv.env['PRIVATE_KEY'];
  final result = '444123$privateKey$password';

  final bytes = utf8.encode(result);
  final digest = sha256.convert(bytes);
  
  return digest.toString();
}
}
