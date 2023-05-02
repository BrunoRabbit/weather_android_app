extension FormExtensions on String {
  bool get isValidEmail {
    return RegExp(r'^\S+@\S+\.\S+$').hasMatch(this);
  }
}
