import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_messanger/models/message.dart';

class MessagesApi {
  final FirebaseFirestore client = FirebaseFirestore.instance;

  Future<List<Message>> getMessages() async {
    final QuerySnapshot snapshot = await client.collection('messages').get();
    final List<Message> messages = snapshot.docs.map((doc) {
      final a = doc.id;
      final rawMessage = Message.fromJson(doc.data() as Map<String, dynamic>);
      final message = rawMessage.copyWith(id: a);
      return message;
    }).toList()
      ..sort();
    return messages;
  }

  Stream<QuerySnapshot> getMessagesStream() {
    return client.collection('messages').snapshots();
  }

  Future<void> sendMessage(Message message) async {
    await client.collection('messages').add(message.toJson());
  }

  Future<void> deleteMessage(Message message) async {
    final id = message.id;
    if (id != null) {
      await client.collection('messages').doc(id).delete();
    }
  }
}
