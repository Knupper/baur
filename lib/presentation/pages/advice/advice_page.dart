// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_baur/data/repositories/advice_repository_mock.dart';
import 'package:flutter_baur/domain/repositories/advice_repository.dart';
import 'package:flutter_baur/domain/use_cases/advice_use_case.dart';
import 'package:flutter_baur/presentation/pages/advice/cubit/advice_cubit.dart';
import 'package:flutter_baur/presentation/pages/advice/cubit/advice_cubit_state.dart';
import 'package:flutter_baur/presentation/pages/advice/widgets/advice_field.dart';
import 'package:flutter_baur/presentation/pages/advice/widgets/error_message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:result_dart/result_dart.dart';

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
      child: const AdvicePage(),
    );
  }
}

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
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: BlocBuilder<AdviceCubit, AdviceCubitState>(
                builder: (context, state) {
                  switch (state) {
                    case AdviceEmptyState():
                      return AdviceField(
                        advice: 'Please fetch data first',
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
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => context.read<AdviceCubit>().fetchAdvice(),
              child: const Text('get advice'),
            ),
          ),
        ],
      ),
    );
  }
}

extension FutureResult<S extends Object, F extends Object> on Future<Result<S, F>> {
  Future<Result<S, F>> either(S Function(S success) fnSuccess, F Function(F failure) fnFailure) => Future.value();
}
