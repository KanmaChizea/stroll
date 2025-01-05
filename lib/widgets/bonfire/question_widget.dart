import 'package:flutter/material.dart';
import 'package:stroll/models/bonfire/user.dart';
import 'package:stroll/theme/extension.dart';

class QuestionWidget extends StatelessWidget {
  final BonfireUser user;
  final String question;
  final String answer;
  const QuestionWidget(
      {required this.user,
      required this.question,
      required this.answer,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    // Margin is half width of the circle
                    margin: const EdgeInsets.only(left: 30, top: 8),
                    //Left padding is half width of circle + spacing
                    padding: const EdgeInsets.fromLTRB(34, 6, 8, 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).appColors.grey.shade900,
                    ),
                    child: Text(
                      '${user.username}, ${user.age}',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    //Left padding is width of circle + spacing
                    padding: const EdgeInsets.fromLTRB(69, 6, 8, 6),
                    child: Text(
                      question,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(),
                  color: Theme.of(context).appColors.grey.shade900,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: CircleAvatar(
                  radius: 25,
                  foregroundImage: AssetImage(user.imagePath),
                ),
              )
            ],
          ),
          Text(
            '"$answer"',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontStyle: FontStyle.italic,
              color:
                  Theme.of(context).appColors.primary.shade100.withOpacity(0.7),
            ),
          )
        ],
      ),
    );
  }
}
