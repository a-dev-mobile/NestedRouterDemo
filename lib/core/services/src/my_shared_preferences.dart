part of services;

/// Base class.
class MySharedPreferences {
  static const String _info = 'local storage';

  static const String _save = 'SAVE';
  static const String _get = 'GET';

  /// SaveString.
  Future<bool> saveString(String key, String value) async {
    final pref = await SharedPreferences.getInstance();
    final result = await pref.setString(key, value);
    log.i('$_save $_info > $key = $value >>> $result');

    return result;
  }

  /// SaveBool.
  Future<bool> saveBool(String key, {bool value = false}) async {
    final pref = await SharedPreferences.getInstance();
    final result = await pref.setBool(key, value);
    log.i('$_save $_info > $key = $value >>> $result');

    return result;
  }

  /// SaveDouble.
  Future<bool> saveDouble(String key, double value) async {
    final pref = await SharedPreferences.getInstance();
    final result = await pref.setDouble(key, value);
    log.i('$_save $_info > $key = $value >>> $result');

    return result;
  }

  /// SaveInt.
  Future<bool> saveInt(String key, int value) async {
    final pref = await SharedPreferences.getInstance();
    final result = await pref.setInt(key, value);
    log.i('$_save $_info > $key = $value >>> $result');

    return result;
  }

  /// GetString.
  Future<String> getString(String key, {String defaultValue = ''}) async {
    final pref = await SharedPreferences.getInstance();
    final result = pref.getString(key) ?? defaultValue;
    log.i('$_get $_info > $key = $result');

    return result;
  }

  /// GetInt.
  Future<int> getInt(String key, {int defaultValue = 0}) async {
    final pref = await SharedPreferences.getInstance();
    final result = pref.getInt(key) ?? defaultValue;
    log.i('$_get $_info > $key = $result');

    return result;
  }

  /// GetDouble.
  Future<double> getDouble(String key, {double defaultValue = 0}) async {
    final pref = await SharedPreferences.getInstance();
    final result = pref.getDouble(key) ?? defaultValue;
    log.i('$_get $_info > $key = $result');

    return result;
  }

  /// GetBoolData.
  Future<bool> getBool(String key, {bool defaultValue = false}) async {
    final pref = await SharedPreferences.getInstance();
    final result = pref.getBool(key) ?? defaultValue;
    log.i('$_get $_info > $key = $result');

    return result;
  }

  /// IsNull.
  Future<bool> isNull(String key) async {
    final pref = await SharedPreferences.getInstance();
    final val = pref.get(key);
    bool result;

    // ignore: avoid_bool_literals_in_conditional_expressions
    result = val == null ? true : false;
    log.i('$_get  $_info | isNull $result | > $key = $val');

    return result;
  }

  /// ClearAll.
  Future<void> clearAll() async {
    final pref = await SharedPreferences.getInstance();
    final result = await pref.clear();
    log.i('CLEAR $_info > $result');
  }
}
