import 'package:flutter/material.dart';
import 'package:flutter_baur/presentation/core/baur_theme.dart';
import 'package:flutter_baur/presentation/pages/advice/advice_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: BaurTheme.lightTheme,
      darkTheme: BaurTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: const AdvicePageProvider(),
    );
  }
}
