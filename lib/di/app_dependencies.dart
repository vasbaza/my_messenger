import 'package:my_messanger/data/api/messages_api.dart';
import 'package:my_messanger/data/repository/messages_repository.dart';
import 'package:my_messanger/data/repository/settings_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDependencies {
  final SharedPreferences _localStorage;
  late final MessagesRepository messagesRepository;
  late final SettingsRepository settingsRepository;
  late final MessagesApi messagesApi;

  AppDependencies(
    this._localStorage,
  ) {
    _init();
  }

  Future<void> _init() async {
    messagesApi = MessagesApi();
    messagesRepository = MessagesRepositoryRemote(messagesApi);
    settingsRepository = SettingsRepository(_localStorage);
  }
}
