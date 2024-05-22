import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_baur/domain/use_cases/advice_use_case.dart';
import 'package:flutter_baur/presentation/pages/advice/cubit/advice_cubit.dart';
import 'package:flutter_baur/presentation/pages/advice/cubit/advice_cubit_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAdviceUseCase extends Mock implements AdviceUseCase {}

void main() {
  group('AdviceCubit', () {
    blocTest(
      'should emit nothing when no method is called',
      build: () => AdviceCubit(useCase: AdviceUseCase()),
      expect: () => <AdviceCubitState>[],
    );

    blocTest(
      'should emit [LoadingState/LoadedState] if fetchAdvice is called',
      build: () => AdviceCubit(
        useCase: AdviceUseCase(),
      ),
      act: (bloc) => bloc.fetchAdvice(),
      expect: () => <AdviceCubitState>[
        const AdviceLoadingState(),
        const AdviceLoadedState(advice: 'Mock loaded advice'),
      ],
    );

    // TODO(all): make the test running
    blocTest(
      'should emit [LoadingState/ErrorState] if fetchAdvice is called and was not successful',
      setUp: () {
        // mock advice use case
      },
      build: () => AdviceCubit(
        useCase: AdviceUseCase(),
      ),
      act: (bloc) => bloc.fetchAdvice(),
      expect: () => <AdviceCubitState>[
        const AdviceLoadingState(),
        const AdviceLoadedState(advice: 'Mock loaded advice'),
      ],
    );
  });
}
