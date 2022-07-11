import 'package:equatable/equatable.dart';
import 'package:my_messanger/actions/actions.dart';
import 'package:my_messanger/models/app_state.dart';
import 'package:redux/redux.dart';

class SettingsScreenViewModel extends Equatable {
  final Store<AppState> _store;

  AppState get state => _store.state;

  const SettingsScreenViewModel(this._store);

  void onSubmitName(String newName) {
    _store.dispatch(SettingName(newName));
  }

  @override
  List<Object?> get props => [_store];
}
