import 'package:my_messanger/actions/actions.dart';
import 'package:redux/redux.dart';
import 'package:my_messanger/models/app_state.dart';

final messagesReducer = combineReducers<AppState>([
  TypedReducer<AppState, ReceivedMessages>(_setMessages),
]);

AppState _setMessages(AppState state, ReceivedMessages action) {
  return state.copyWith(isLoading: false, messages: action.messages);
}
