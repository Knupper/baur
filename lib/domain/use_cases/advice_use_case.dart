import 'package:flutter_baur/data/failure/failure.dart';
import 'package:flutter_baur/domain/entities/advice_entity.dart';
import 'package:flutter_baur/domain/repositories/advice_repository.dart';
import 'package:result_dart/result_dart.dart';

class AdviceUseCase {
  AdviceUseCase({required this.repository});

  final AdviceRepository repository;
  AsyncResult<AdviceEntity, BaurFailure> read() async {
    final result = repository.getAdvice();

    return result.fold(
      (success) => Result.success(AdviceEntity(advice: success.advice, id: success.id)),
      (failure) => Result.failure(failure),
    );
  }
}
