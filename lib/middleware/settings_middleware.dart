import 'package:flutter/material.dart';
import 'package:my_messanger/actions/actions.dart';
import 'package:my_messanger/data/repository/settings_repository.dart';
import 'package:my_messanger/models/app_state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createSettingsMiddleware(
  SettingsRepository settingsRepository,
) {
  return [
    TypedMiddleware<AppState, SettingName>(_setName(settingsRepository)),
    TypedMiddleware<AppState, GettingName>(_getName(settingsRepository)),
  ];
}

void Function(
  Store<AppState> store,
  SettingName action,
  NextDispatcher next,
) _setName(
  SettingsRepository settingsRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
      await settingsRepository.setName(action.name);
      store.dispatch(SetName(action.name));
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  };
}

void Function(
  Store<AppState> store,
  GettingName action,
  NextDispatcher next,
) _getName(
  SettingsRepository settingsRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
      final name = await settingsRepository.getName();
      store.dispatch(GetName(name));
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  };
}
