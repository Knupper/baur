import 'package:flutter_baur/domain/entities/advice_entity.dart';
import 'package:result_dart/result_dart.dart';

class AdviceUseCase {
  Future<Result<AdviceEntity, Exception>> read() async {
    return const Result.success(
      AdviceEntity(
        advice: 'advice',
        id: 1,
      ),
    );
  }
}
