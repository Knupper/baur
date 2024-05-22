sealed class AdviceCubitState {
  const AdviceCubitState();
}

class AdviceEmptyState extends AdviceCubitState {
  const AdviceEmptyState();
}

class AdviceLoadingState extends AdviceCubitState {
  const AdviceLoadingState();
}

class AdviceLoadedState extends AdviceCubitState {
  const AdviceLoadedState({required this.advice});
  final String advice;
}

class AdviceErrorState extends AdviceCubitState {
  const AdviceErrorState({required this.error});
  final String error;
}
