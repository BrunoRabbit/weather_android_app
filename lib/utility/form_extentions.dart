extension FormExtentions on String? {
  bool get isValidEmail {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this!);
  }

  bool get isValidName {
    return RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$").hasMatch(this!);
  }

  bool get isNull {
    return this!.isNotEmpty;
  }

}
