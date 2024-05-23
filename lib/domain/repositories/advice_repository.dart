import 'package:flutter_baur/data/dto/advice_dto.dart';
import 'package:flutter_baur/data/failure/failure.dart';
import 'package:result_dart/result_dart.dart';

abstract class AdviceRepository {
  AsyncResult<AdviceDto, BaurFailure> getAdvice();
}
