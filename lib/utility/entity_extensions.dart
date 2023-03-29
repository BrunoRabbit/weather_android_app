extension EntityExtension on Map<String, dynamic> {
  T? verifyNull<T>(String key) {
    final value = this[key];

    if (value == null) {
      return null;
    }
    if (value is T) {
      return value;
    }

    throw FormatException(
        'Value for key $key is not of type $T, actual type is ${value.runtimeType}');
  }
}
