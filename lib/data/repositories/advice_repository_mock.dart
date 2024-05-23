import 'package:flutter_baur/data/dto/advice_dto.dart';
import 'package:flutter_baur/data/failure/failure.dart';
import 'package:flutter_baur/domain/repositories/advice_repository.dart';
import 'package:result_dart/result_dart.dart';

class AdviceRepositoryMock implements AdviceRepository {
  final mockItems = [
    AdviceDto(advice: 'advice', id: 0),
    AdviceDto(advice: 'short advice', id: 1),
    AdviceDto(advice: 'advice asdasd asd asd asdad asd dasd asd asd ad asd', id: 2),
    AdviceDto(advice: '-', id: 3),
  ];

  @override
  AsyncResult<AdviceDto, BaurFailure> getAdvice() {
    mockItems.shuffle();
    final result = mockItems.first;

    // return Result<AdviceDto, Failure>.success(result).toFuture();
    return Result<AdviceDto, BaurFailure>.success(result).toAsyncResult();
  }
}

extension ResultExtension<S extends Object, F extends Object> on Result<S, F> {
  Future<Result<S, F>> toFuture() => Future.value(this);
}
