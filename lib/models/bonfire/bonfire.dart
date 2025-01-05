import 'package:equatable/equatable.dart';

import 'package:stroll/models/bonfire/user.dart';
import 'package:stroll/models/bonfire/question_options.dart';

class Bonfire extends Equatable {
  final String id;
  final String question;
  final String userAnswer;
  final List<QuestionOptions> options;
  final BonfireUser user;
  final DateTime expiryTime;
  final int answerCount;

  const Bonfire({
    required this.id,
    required this.question,
    required this.userAnswer,
    required this.options,
    required this.user,
    required this.expiryTime,
    required this.answerCount,
  });

  @override
  List<Object?> get props => [id];

  Bonfire copyWith({
    DateTime? expiryTime,
    int? answerCount,
  }) {
    return Bonfire(
      id: id,
      question: question,
      userAnswer: userAnswer,
      options: options,
      user: user,
      expiryTime: expiryTime ?? this.expiryTime,
      answerCount: answerCount ?? this.answerCount,
    );
  }

  factory Bonfire.fromMap(Map<String, dynamic> map) {
    return Bonfire(
      id: map['id'] as String,
      question: map['question'] as String,
      userAnswer: map['answer'] as String,
      options: List<QuestionOptions>.from(
        (map['options'] as List).map<QuestionOptions>(
          (x) => QuestionOptions.fromMap(x as Map<String, dynamic>),
        ),
      ),
      user: BonfireUser.fromMap(map['user'] as Map<String, dynamic>),
      expiryTime: DateTime.parse(map['expiryTime'] as String),
      answerCount: map['answerCount'] as int,
    );
  }
}
