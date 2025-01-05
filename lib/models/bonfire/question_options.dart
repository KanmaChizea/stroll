import 'package:equatable/equatable.dart';

class QuestionOptions extends Equatable {
  final String id;
  final String text;
  const QuestionOptions({required this.id, required this.text});

  factory QuestionOptions.fromMap(Map<String, dynamic> map) {
    return QuestionOptions(
      id: map['id'] as String,
      text: map['text'] as String,
    );
  }

  @override
  List<Object?> get props => [id];
}
