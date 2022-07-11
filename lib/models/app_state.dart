import 'package:equatable/equatable.dart';
import 'package:my_messanger/models/message.dart';

class AppState extends Equatable {
  final bool isLoading;
  final List<Message> messages;
  final String name;

  const AppState({
    required this.isLoading,
    required this.messages,
    this.name = 'Stranger',
  });

  factory AppState.initial() {
    return const AppState(
      isLoading: true,
      messages: [],
      name: 'Stranger',
    );
  }

  AppState copyWith({
    bool? isLoading,
    List<Message>? messages,
    String? author,
  }) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      messages: messages ?? this.messages,
      name: author ?? this.name,
    );
  }

  @override
  List<Object?> get props => [isLoading];
}
