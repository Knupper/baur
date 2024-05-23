import 'package:flutter_baur/data/dto/advice_dto.dart';
import 'package:flutter_baur/data/failure/failure.dart';
import 'package:flutter_baur/domain/entities/advice_entity.dart';
import 'package:flutter_baur/domain/repositories/advice_repository.dart';
import 'package:result_dart/result_dart.dart';

class AdviceUseCase {
  AdviceUseCase({required this.repository});

  final AdviceRepository repository;
  AsyncResult<AdviceEntity, BaurFailure> read({String? id}) async {
    AsyncResult<AdviceDto, BaurFailure> result;
    final parsedInt = int.tryParse(id ?? '');

    if (parsedInt == null) {
      result = repository.getRandomAdvice();
    } else {
      result = repository.getAdvice(id: parsedInt);
    }

    return result.fold(
      (success) => Result.success(AdviceEntity(advice: success.advice, id: success.id)),
      (failure) => Result.failure(failure),
    );
  }
}
