import 'package:flutter/material.dart';
import 'package:stroll/theme/spacing.dart';

class AppError extends StatelessWidget {
  final String error;
  final Function()? retryFunction;
  final String? retryButtonText;
  const AppError(
      {required this.error,
      this.retryFunction,
      this.retryButtonText,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Text(
            'Error',
            style: TextStyle(fontSize: 24),
          ),
          const VerticalSpacing(8),
          Text(
            error,
            textAlign: TextAlign.center,
          ),
          const VerticalSpacing(8),
          if (retryFunction != null)
            ElevatedButton(
              onPressed: retryFunction,
              child: Text(
                retryButtonText ?? 'Try again',
              ),
            ),
          const Spacer(),
        ],
      ),
    );
  }
}
