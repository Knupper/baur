import 'package:flutter/material.dart';
import 'package:flutter_baur/presentation/pages/advice/cubit/advice_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef OnButtonPressedCallback = Function({String? id});
typedef OnFieldChangedCallback = Function({String? value});

class AdviceEmpty extends StatefulWidget {
  const AdviceEmpty({
    super.key,
    required this.onButtonPressed,
    required this.onFieldChanged,
  });

  final OnButtonPressedCallback onButtonPressed;
  final OnFieldChangedCallback onFieldChanged;

  @override
  State<AdviceEmpty> createState() => _AdviceEmptyState();
}

class _AdviceEmptyState extends State<AdviceEmpty> {
  final TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            // controller: _editingController,
            onChanged: (value) => widget.onFieldChanged(value: value),
          ),
        ),
        ElevatedButton(
          onPressed: () => widget.onButtonPressed(id: _editingController.text),
          child: const Text('fetch'),
        ),
      ],
    );
  }
}
