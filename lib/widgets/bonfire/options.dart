import 'package:flutter/material.dart';
import 'package:stroll/models/bonfire/question_options.dart';
import 'package:stroll/theme/extension.dart';
import 'package:stroll/theme/spacing.dart';

class QuestionOptionsWidget extends StatelessWidget {
  final List<QuestionOptions> options;
  final String? selectedOption;
  final Function(String) onOptionSelected;
  const QuestionOptionsWidget(
      {required this.options,
      required this.selectedOption,
      required this.onOptionSelected,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (options.length / 2 * 62) + ((options.length - 2) * 12),
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: false,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 12,
            mainAxisExtent: 62,
          ),
          itemCount: options.length,
          itemBuilder: (context, index) {
            final isSelected = selectedOption == options[index].id;
            return Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Theme.of(context).appColors.grey.shade800,
              child: InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onTap: () => onOptionSelected(options[index].id),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: isSelected
                        ? Border.all(
                            width: 2,
                            color: Theme.of(context).appColors.primary)
                        : null,
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(-1, -1),
                        blurRadius: 2,
                        spreadRadius: -1,
                        color: Color(0x4D000000),
                      ),
                      BoxShadow(
                        offset: Offset(1, 1),
                        blurRadius: 2,
                        spreadRadius: -1,
                        color: Color(0x4D484848),
                      ),
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 8,
                        spreadRadius: 0,
                        color: Color(0x4D000000),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.5, horizontal: 6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected
                              ? Theme.of(context).appColors.primary
                              : null,
                          border: isSelected
                              ? null
                              : Border.all(
                                  color:
                                      Theme.of(context).appColors.grey.shade300,
                                ),
                        ),
                        child: Text(
                          String.fromCharCode(65 + index),
                          style: TextStyle(
                            fontSize: 12,
                            color: isSelected
                                ? Theme.of(context).appColors.grey.shade50
                                : Theme.of(context).appColors.grey.shade300,
                          ),
                        ),
                      ),
                      const HorizontalSpacing(5),
                      Expanded(
                        child: Text(
                          options[index].text,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            height: 1.2,
                            color: Theme.of(context).appColors.grey.shade300,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
