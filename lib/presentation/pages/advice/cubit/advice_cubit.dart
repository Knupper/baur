import 'package:flutter_baur/presentation/pages/advice/cubit/advice_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdviceCubit extends Cubit<AdviceCubitState> {
  AdviceCubit() : super(const AdviceErrorState(error: 'FEHLER'));

  Future<void> fetchAdvice() {
    emit(const AdviceLoadingState());

    return Future.delayed(
      const Duration(seconds: 2),
      () => emit(
        const AdviceLoadedState(advice: 'Mock loaded advice'),
      ),
    );
  }
}
