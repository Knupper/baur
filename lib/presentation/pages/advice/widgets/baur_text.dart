import 'package:flutter/material.dart';

class BaurText extends StatelessWidget {
  const BaurText({
    super.key,
    required this.text,
    required this.style,
  });

  const BaurText.title({
    super.key,
    required this.text,
  }) : style = BaurTextStyle.title;

  const BaurText.body({
    super.key,
    required this.text,
  }) : style = BaurTextStyle.body;

  final String text;
  final BaurTextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _getBaurTextStyle(context),
    );
  }

  TextStyle _getBaurTextStyle(context) {
    switch (style) {
      case BaurTextStyle.title:
        return Theme.of(context).textTheme.bodyLarge!;
      case BaurTextStyle.body:
        return const TextStyle(color: Colors.grey, fontSize: 14.0);
    }
  }
}

enum BaurTextStyle {
  title,
  body,
}
