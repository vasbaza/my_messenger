import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
@immutable
class Message extends Equatable implements Comparable<Message> {
  @JsonValue('body')
  final String body;
  @JsonValue('author')
  final String author;
  @JsonValue('author')
  final DateTime dateCreated;
  final String? id;

  const Message({
    required this.body,
    required this.author,
    required this.dateCreated,
    this.id,
  });

  Message copyWith({
    String? id,
    String? body,
    String? author,
    DateTime? dateCreated,
  }) {
    return Message(
      id: id ?? this.id,
      body: body ?? this.body,
      author: author ?? this.author,
      dateCreated: dateCreated ?? this.dateCreated,
    );
  }

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);

  @override
  List<Object?> get props => [body, author, dateCreated];

  @override
  int compareTo(Message other) {
    return dateCreated.compareTo(other.dateCreated);
  }
}
