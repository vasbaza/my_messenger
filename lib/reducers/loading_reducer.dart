import 'package:my_messanger/actions/actions.dart';
import 'package:redux/redux.dart';
import 'package:my_messanger/models/app_state.dart';

final loadingReducer = combineReducers<AppState>([
  TypedReducer<AppState, FetchingMessages>(_setLoading),
  TypedReducer<AppState, ReceivedMessages>(_setLoaded),
]);

AppState _setLoading(AppState state, FetchingMessages action) {
  return state.copyWith(isLoading: true);
}

AppState _setLoaded(AppState state, ReceivedMessages action) {
  return state.copyWith(isLoading: false);
}