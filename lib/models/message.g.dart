// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      body: json['body'] as String,
      author: json['author'] as String,
      dateCreated: DateTime.parse(json['dateCreated'] as String),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'body': instance.body,
      'author': instance.author,
      'dateCreated': instance.dateCreated.toIso8601String(),
      'id': instance.id,
    };
