import 'package:flutter/material.dart';
import 'package:flutter_baur/domain/use_cases/advice_use_case.dart';
import 'package:flutter_baur/presentation/pages/advice/cubit/advice_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:result_dart/result_dart.dart';

class AdviceCubit extends Cubit<AdviceCubitState> {
  AdviceCubit({
    required this.useCase,
    @visibleForTesting AdviceCubitState? defaultState,
  }) : super(defaultState ?? const AdviceEmptyState());

  final AdviceUseCase useCase;

  void fetchAdvice({String? id}) {
    emit(const AdviceLoadingState());

    useCase.read(id: id).fold(
          (sucess) => emit(AdviceLoadedState(advice: sucess.advice)),
          (failure) => emit(AdviceErrorState(error: failure.toString())),
        );
  }
}
