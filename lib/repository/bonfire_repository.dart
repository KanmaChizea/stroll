import 'package:stroll/models/bonfire/bonfire.dart';

class BonfireRepository {
  final _mockedGetBonfireResponse = [
    {
      'id': '123',
      'question': 'What is your favorite time of the day?',
      'answer': 'Mine is definitely the peace in the morning.',
      'expiryTime': DateTime.now().add(const Duration(hours: 22)).toString(),
      'answerCount': 103,
      'user': {
        'username': 'Angelina',
        'age': 24,
        'imagePath': 'lib/assets/images/avatar1.png'
      },
      'options': [
        {'id': 'OptionA', 'text': 'The peace in the early mornings'},
        {'id': 'OptionB', 'text': 'The magical golden hours'},
        {'id': 'OptionC', 'text': 'Wind-down time after dinners'},
        {'id': 'OptionD', 'text': 'The serenity past midnight'},
      ],
    }
  ];

  Future<List<Bonfire>> getBonfires() async {
    // Simulate network request
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockedGetBonfireResponse
        .map((item) => Bonfire.fromMap(item))
        .toList();
  }
}
