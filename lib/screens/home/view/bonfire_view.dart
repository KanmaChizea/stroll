import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroll/screens/home/view_model/home_cubit.dart';
import 'package:stroll/theme/extension.dart';
import 'package:stroll/theme/spacing.dart';
import 'package:stroll/widgets/animations/shrink_dismissible.dart';
import 'package:stroll/widgets/bonfire/bonfire_header.dart';
import 'package:stroll/widgets/bonfire/gradient_background.dart';
import 'package:stroll/widgets/bonfire/options.dart';
import 'package:stroll/widgets/bonfire/question_widget.dart';
import 'package:stroll/widgets/shared/error_widget.dart';
import 'package:stroll/widgets/shared/round_button.dart';
import 'package:stroll/widgets/shared/svg_icons.dart';

class BonfireView extends StatefulWidget {
  const BonfireView({super.key});

  @override
  State<BonfireView> createState() => _BonfireViewState();
}

class _BonfireViewState extends State<BonfireView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

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
        if (bonfireData.isEmpty) {
          return const Center(
            child: Text('No Bonfires at the moment'),
          );
        }
        return PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: bonfireData.length,
          controller: _pageController,
          itemBuilder: (context, index) {
            return ShrinkDismissible(
              key: ValueKey(bonfireData[index]),
              controller: _controller,
              child: Stack(
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
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
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
                                      onPress: () async {
                                        await context
                                            .read<HomeViewModel>()
                                            .submitAnswer(
                                              bonfireData[index].id,
                                              () async =>
                                                  await _controller.forward(),
                                            );
                                        _controller.reset();
                                        _pageController.jumpToPage(index + 1);
                                      },
                                      child: const SvgIcon(name: 'arrow-right'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          if (homeState
                                  .isSendingResponse[bonfireData[index].id] ==
                              true)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: LinearProgressIndicator(
                                  color: Theme.of(context).appColors.primary),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
