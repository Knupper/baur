import 'package:flutter/material.dart';
import 'package:flutter_baur/presentation/pages/advice/widgets/baur_text.dart';

class AdviceField extends StatelessWidget {
  const AdviceField({
    super.key,
    required this.advice,
  });

  final String advice;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: BaurText.title(text: advice),
        ),
      ),
    );
  }
}
