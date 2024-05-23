import 'package:flutter_baur/data/data_sources/advice_remote_data_source.dart';
import 'package:flutter_baur/data/dto/advice_dto.dart';
import 'package:flutter_baur/data/failure/failure.dart';
import 'package:flutter_baur/domain/repositories/advice_repository.dart';
import 'package:result_dart/result_dart.dart';

class AdviceRepositoryRest implements AdviceRepository {
  AdviceRepositoryRest({required this.dataSource});
  final AdviceDataSource dataSource;

  @override
  AsyncResult<AdviceDto, BaurFailure> getAdvice({required int id}) async {
    final result = await dataSource.getAdviceFromApi(id);
    return result;
  }

  @override
  AsyncResult<AdviceDto, BaurFailure> getRandomAdvice() async {
    final result = await dataSource.getRandomAdviceFromApi();
    return result;
  }
}
