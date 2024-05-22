import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_baur/presentation/pages/advice/cubit/advice_cubit.dart';
import 'package:flutter_baur/presentation/pages/advice/cubit/advice_cubit_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AdviceCubit', () {
    blocTest(
      'should emit nothing when no method is called',
      build: () => AdviceCubit(),
      expect: () => <AdviceCubitState>[],
    );

    blocTest(
      'should emit [LoadingState/LoadedState] if fetchAdvice is called',
      build: () => AdviceCubit(),
      act: (bloc) => bloc.fetchAdvice(),
      expect: () => <AdviceCubitState>[
        const AdviceLoadingState(),
        const AdviceLoadedState(advice: 'Mock loaded advice'),
      ],
    );
  });
}
