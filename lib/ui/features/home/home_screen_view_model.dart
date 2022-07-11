import 'package:equatable/equatable.dart';
import 'package:my_messanger/actions/actions.dart';
import 'package:my_messanger/models/app_state.dart';
import 'package:my_messanger/models/message.dart';
import 'package:redux/redux.dart';

class HomeScreenViewModel extends Equatable {
  final Store<AppState> _store;

  const HomeScreenViewModel(this._store);

  AppState get state => _store.state;

  String get author => state.name;

  void onSendMessage(String messageBody) {
    final message = Message(
      body: messageBody,
      author: state.name,
      dateCreated: DateTime.now(),
    );
    _store.dispatch(SendingMessage(message));
  }


  void onDeleteMessage(Message message) {
    _store.dispatch(DeletingMessage(message));
  }

  @override
  List<Object?> get props => [state];
}
