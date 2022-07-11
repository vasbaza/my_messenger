import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_messanger/data/api/messages_api.dart';
import 'package:my_messanger/models/message.dart';

abstract class MessagesRepository {
  Stream<List<Message>> getMessagesStream();

  Future<void> sendMessage(Message message);

  Future<void> deleteMessage(Message message);
}

class MessagesRepositoryRemote implements MessagesRepository {
  final MessagesApi api;

  MessagesRepositoryRemote(this.api);

  @override
  Future<void> sendMessage(Message message) async {
    await api.sendMessage(message);
  }

  @override
  Future<void> deleteMessage(Message message) async {
    await api.deleteMessage(message);
  }

  @override
  Stream<List<Message>> getMessagesStream() {
    final snapShotStream = api.getMessagesStream();
    return snapShotStream.map((snapshot) => _mapSnapshotToMessages(snapshot));
  }

  List<Message> _mapSnapshotToMessages(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      final a = doc.id;
      final rawMessage = Message.fromJson(doc.data() as Map<String, dynamic>);
      final message = rawMessage.copyWith(id: a);
      return message;
    }).toList()
      ..sort();
  }
}
