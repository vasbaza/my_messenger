import 'package:my_messanger/models/message.dart';

class FetchingMessages {}

class ReceivedMessages {
  final Exception? error;
  final List<Message> messages;

  ReceivedMessages(this.messages, {this.error});
}

class SendingMessage {
  final Message message;

  SendingMessage(this.message);
}

class SentMessage {
  final Exception? error;
  final Message message;

  SentMessage(this.message, {this.error});
}

class GettingName {
  GettingName();
}

class GetName {
  final String name;

  GetName(this.name);
}

class SettingName {
  final String name;

  SettingName(this.name);
}

class SetName {
  final String name;

  SetName(this.name);
}

class DeletingMessage {
  final Message message;

  DeletingMessage(this.message);
}

