extension FormExtensions on String? {
  bool get isValidEmail {
    return RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9.-]+$").hasMatch(this!);
  }
}
