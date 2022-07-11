import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_messanger/models/message.dart';

class MessageCard extends StatelessWidget {
  final Message message;

  const MessageCard({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = DateFormat.yMMMd().format(message.dateCreated);
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(message.author.substring(0, 1)),
        ),
        title: Text(message.author),
        subtitle: Text(message.body),
        trailing: Text(date),
      ),
    );
  }
}
