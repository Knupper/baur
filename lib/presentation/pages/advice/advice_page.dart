import 'package:flutter/material.dart';
import 'package:flutter_baur/presentation/pages/advice/widgets/advice_field.dart';

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'advice',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Column(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: AdviceField(
                advice: 'Test advice, to check if our layout is working correctly.',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => debugPrint('tapped'),
              child: const Text('get advice'),
            ),
          ),
        ],
      ),
    );
  }
}
