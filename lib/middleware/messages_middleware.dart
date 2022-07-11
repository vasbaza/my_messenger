import 'package:flutter/material.dart';
import 'package:my_messanger/actions/actions.dart';
import 'package:my_messanger/data/repository/messages_repository.dart';
import 'package:my_messanger/models/app_state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createMessagesMiddleware(
  MessagesRepository messagesRepository,
) {
  return [
    TypedMiddleware<AppState, FetchingMessages>(
        _getMessages(messagesRepository)),
    TypedMiddleware<AppState, SendingMessage>(_sendMessage(messagesRepository)),
    TypedMiddleware<AppState, DeletingMessage>(
      _deleteMessage(messagesRepository),
    ),
  ];
}

void Function(
  Store<AppState> store,
  FetchingMessages action,
  NextDispatcher next,
) _getMessages(
  MessagesRepository messagesRepository,
) {
  return (store, action, next) async {
    next(action);
    final stream = messagesRepository.getMessagesStream();
    stream.listen((messages) {
      store.dispatch(ReceivedMessages(messages));
    });
  };
}

void Function(
  Store<AppState> store,
  SendingMessage action,
  NextDispatcher next,
) _sendMessage(
  MessagesRepository messagesRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
      await messagesRepository.sendMessage(action.message);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  };
}

void Function(
  Store<AppState> store,
  DeletingMessage action,
  NextDispatcher next,
) _deleteMessage(
  MessagesRepository messagesRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
      await messagesRepository.deleteMessage(action.message);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  };
}


