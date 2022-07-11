import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {
  final SharedPreferences _localStorage;

  SettingsRepository(this._localStorage);

  Future<String> getName() async {
    return _localStorage.getString('name') ?? 'Stranger';
  }

  Future<bool> setName(String name) async {
    return _localStorage.setString('name', name);
  }
}
