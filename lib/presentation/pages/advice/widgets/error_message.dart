import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    super.key,
    required this.errorText,
  });
  final String errorText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error,
          size: 40,
          color: Colors.redAccent,
        ),
        const SizedBox.square(
          dimension: 20,
        ),
        Flexible(
          child: Text(
            errorText,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      ],
    );
  }
}
