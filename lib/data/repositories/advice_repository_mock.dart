import 'package:flutter_baur/data/dto/advice_dto.dart';
import 'package:flutter_baur/data/failure/failure.dart';
import 'package:flutter_baur/domain/repositories/advice_repository.dart';
import 'package:result_dart/result_dart.dart';

class AdviceRepositoryMock implements AdviceRepository {
  final mockItems = List.generate(
    100,
    (index) => AdviceDto(advice: 'my $index advice is always the best.', id: index),
  );

  @override
  AsyncResult<AdviceDto, BaurFailure> getRandomAdvice() {
    mockItems.shuffle();
    final result = mockItems.first;

    // return Result<AdviceDto, Failure>.success(result).toFuture();
    return Result<AdviceDto, BaurFailure>.success(result).toAsyncResult();
  }

  @override
  AsyncResult<AdviceDto, BaurFailure> getAdvice({required int id}) {
    final result = mockItems.firstWhere(
      (element) => element.id == id,
    );

    // return Result<AdviceDto, Failure>.success(result).toFuture();
    return Result<AdviceDto, BaurFailure>.success(result).toAsyncResult();
  }
}

extension ResultExtension<S extends Object, F extends Object> on Result<S, F> {
  Future<Result<S, F>> toFuture() => Future.value(this);
}
