import 'package:flutter/material.dart';
import 'package:flutter_baur/domain/repositories/advice_repository.dart';
import 'package:flutter_baur/domain/use_cases/advice_use_case.dart';
import 'package:flutter_baur/presentation/pages/advice/cubit/advice_cubit.dart';
import 'package:flutter_baur/presentation/pages/advice/cubit/advice_cubit_state.dart';
import 'package:flutter_baur/presentation/pages/advice/widgets/advice_empty.dart';
import 'package:flutter_baur/presentation/pages/advice/widgets/advice_field.dart';
import 'package:flutter_baur/presentation/pages/advice/widgets/error_message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// https://github.com/Knupper/baur

class AdvicePageProvider extends StatelessWidget {
  const AdvicePageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdviceCubit>(
      create: (_) => AdviceCubit(
        useCase: AdviceUseCase(
          repository: RepositoryProvider.of<AdviceRepository>(context),
        ),
      ),
      child: AdvicePage(),
    );
  }
}

class AdvicePage extends StatelessWidget {
  AdvicePage({super.key});

  final TextEditingController _editingController = TextEditingController();

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
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: BlocBuilder<AdviceCubit, AdviceCubitState>(
                builder: (context, state) {
                  switch (state) {
                    case AdviceEmptyState():
                      return AdviceEmpty(
                        onFieldChanged: ({value}) => context.read<AdviceCubit>().valueChanged(value: value),
                        onButtonPressed: ({id}) => context.read<AdviceCubit>().fetchAdvice(id: id),
                      );
                    case AdviceLoadingState():
                      return const Center(
                        child: SizedBox(
                          height: 200,
                          width: 200,
                          child: CircularProgressIndicator(
                            color: Colors.green,
                          ),
                        ),
                      );
                    case AdviceLoadedState loaded:
                      return AdviceField(
                        advice: loaded.advice,
                      );
                    case AdviceErrorState errorState:
                      return Center(
                        child: ErrorMessage(
                          errorText: errorState.error,
                        ),
                      );
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _editingController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Advice Id'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => context.read<AdviceCubit>().fetchAdvice(id: _editingController.text),
              child: const Text('get advice'),
            ),
          ),
        ],
      ),
    );
  }
}
