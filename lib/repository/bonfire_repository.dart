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
    },
    {
      'id': '456',
      'question': 'What is your favorite food?',
      'answer': 'Mine is definitely rice.',
      'expiryTime': DateTime.now().add(const Duration(hours: 22)).toString(),
      'answerCount': 10,
      'user': {
        'username': 'Simi',
        'age': 30,
        'imagePath': 'lib/assets/images/avatar1.png'
      },
      'options': [
        {'id': 'OptionA', 'text': 'Rice'},
        {'id': 'OptionB', 'text': 'Pasta'},
        {'id': 'OptionC', 'text': 'Noodles'},
        {'id': 'OptionD', 'text': 'Water'},
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

  Future submitResponse(String bonfireId, String optionId) async {
    // Simulate network request
    await Future.delayed(const Duration(seconds: 3));
  }
}
