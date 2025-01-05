import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroll/screens/home/view_model/home_cubit.dart';
import 'package:stroll/theme/extension.dart';
import 'package:stroll/theme/spacing.dart';
import 'package:stroll/widgets/bonfire/bonfire_header.dart';
import 'package:stroll/widgets/bonfire/gradient_background.dart';
import 'package:stroll/widgets/bonfire/options.dart';
import 'package:stroll/widgets/bonfire/question_widget.dart';
import 'package:stroll/widgets/shared/error_widget.dart';
import 'package:stroll/widgets/shared/round_button.dart';
import 'package:stroll/widgets/shared/svg_icons.dart';

class BonfireView extends StatelessWidget {
  const BonfireView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeState = context.watch<HomeViewModel>().state;
    return homeState.bonfire.when(
      loading: () {
        return const Center(child: CircularProgressIndicator.adaptive());
      },
      error: (error) {
        return AppError(
          error: error,
          retryFunction: context.read<HomeViewModel>().initializeBonfire,
        );
      },
      data: (bonfireData) {
        return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: bonfireData.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Image.asset('lib/assets/images/sunset.png'),
                  GradientBackground(
                    child: SafeArea(
                      child: Column(
                        children: [
                          const VerticalSpacing(16),
                          BonfireHeader(
                            personCount: 103,
                            timeLeft: DateTime(2025, 1, 6),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                QuestionWidget(
                                  question: bonfireData[index].question,
                                  answer: bonfireData[index].userAnswer,
                                  user: bonfireData[index].user,
                                ),
                                const VerticalSpacing(14),
                                QuestionOptionsWidget(
                                  options: bonfireData[index].options,
                                  selectedOption: homeState
                                      .selectedOptions[bonfireData[index].id],
                                  onOptionSelected: (option) {
                                    context.read<HomeViewModel>().selectOption(
                                        bonfireData[index].id, option);
                                  },
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Pick your option.\nSee who has a similar mind.',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Theme.of(context)
                                              .appColors
                                              .grey
                                              .shade100,
                                        ),
                                      ),
                                    ),
                                    RoundButton(
                                      outline: true,
                                      onPress: () {},
                                      child: const SvgIcon(name: 'microphone'),
                                    ),
                                    const HorizontalSpacing(6),
                                    RoundButton(
                                      onPress: () {},
                                      child: const SvgIcon(name: 'arrow-right'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            });
      },
    );
  }
}
