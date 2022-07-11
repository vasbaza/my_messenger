import 'package:flutter/material.dart';
import 'package:my_messanger/actions/actions.dart';
import 'package:my_messanger/app.dart';
import 'package:my_messanger/data/services/firebase_service.dart';
import 'package:my_messanger/di/app_dependencies.dart';
import 'package:my_messanger/middleware/messages_middleware.dart';
import 'package:my_messanger/middleware/settings_middleware.dart';
import 'package:my_messanger/models/app_state.dart';
import 'package:my_messanger/reducers/app_state_reducer.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService().init();
  final localStorage = await SharedPreferences.getInstance();
  final dependencies = AppDependencies(localStorage);
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [
      ...createMessagesMiddleware(dependencies.messagesRepository),
      ...createSettingsMiddleware(dependencies.settingsRepository),
    ],
  );
  store.dispatch(GettingName());
  store.dispatch(FetchingMessages());
  runApp(
    App(store: store),
  );
}
