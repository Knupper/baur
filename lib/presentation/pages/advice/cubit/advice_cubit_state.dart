import 'package:equatable/equatable.dart';

sealed class AdviceCubitState with EquatableMixin {
  const AdviceCubitState();

  @override
  List<Object?> get props => [];
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

  @override
  List<Object?> get props => [advice];
}

class AdviceErrorState extends AdviceCubitState {
  const AdviceErrorState({required this.error});
  final String error;

  @override
  List<Object?> get props => [error];
}
