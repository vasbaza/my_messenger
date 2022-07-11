import 'package:my_messanger/models/app_state.dart';
import 'package:my_messanger/reducers/loading_reducer.dart';
import 'package:my_messanger/reducers/messages_reducer.dart';
import 'package:my_messanger/reducers/name_reducer.dart';
import 'package:redux/redux.dart';

final appReducer = combineReducers<AppState>([
  loadingReducer,
  messagesReducer,
  nameReducer,
]);
