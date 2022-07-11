import 'package:my_messanger/actions/actions.dart';
import 'package:redux/redux.dart';
import 'package:my_messanger/models/app_state.dart';

final nameReducer = combineReducers<AppState>([
  TypedReducer<AppState, SetName>(_setName),
  TypedReducer<AppState, GetName>(_getName),
]);

AppState _setName(AppState state, SetName action) {
  return state.copyWith(author: action.name);
}

AppState _getName(AppState state, GetName action) {
  return state.copyWith(author: action.name);
}
