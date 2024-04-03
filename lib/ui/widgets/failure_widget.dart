import 'package:cryptocurrency_chart_app/data/exceptions.dart';
import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({
    super.key,
    this.onPressed,
    required this.failure,
    this.icon = Icons.error_outline,
    this.buttonText = "Update",
  });

  final ApiException failure;
  final IconData icon;
  final String buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    String failureText;
    switch (failure) {
      case (ApiException.network):
        failureText =
            "Something is wrong with the Internet. Check your connection and try to update";
        break;
      case (ApiException.jsonKey):
        failureText = "Oops... Something went wrong. Please try again";
        break;
      default:
        failureText = "Oops... Unknown error. Please try again";
        break;
    }

    Widget exceptionIcon = Icon(
      icon,
      size: 160,
      color: Theme.of(context).colorScheme.surface,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            exceptionIcon,
            const SizedBox(height: 20),
            Text(
              failureText,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}