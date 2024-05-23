import 'dart:convert';

import 'package:flutter_baur/data/dto/advice_dto.dart';
import 'package:flutter_baur/data/failure/failure.dart';
import 'package:http/http.dart' as http;
import 'package:result_dart/result_dart.dart';

abstract class AdviceDataSource {
  AsyncResult<AdviceDto, BaurFailure> getAdviceFromApi(int id);

  AsyncResult<AdviceDto, BaurFailure> getRandomAdviceFromApi();
}

class AdviceRestApiDataSource implements AdviceDataSource {
  AdviceRestApiDataSource({required this.client});

  static String url = 'https://api.flutter-community.com/api/v1/advice';
  final http.Client client;

  @override
  AsyncResult<AdviceDto, BaurFailure> getRandomAdviceFromApi() async {
    try {
      final response = await client.get(
        Uri.parse(url),
        headers: {
          'accept': 'application/json',
        },
      );
      if (response.statusCode != 200) {
        return Result.failure(ServerFailure(
          statusCode: response.statusCode,
          body: response.body,
        ));
      } else {
        final responseBody = jsonDecode(response.body);
        return Result.success(AdviceDto.fromJson(responseBody));
      }
    } catch (error) {
      return Result.failure(UnknownFailure());
    }
  }

  @override
  AsyncResult<AdviceDto, BaurFailure> getAdviceFromApi(int id) async {
    try {
      final response = await client.get(
        Uri.parse('$url/$id'),
        headers: {
          'accept': 'application/json',
        },
      );
      if (response.statusCode != 200) {
        return Result.failure(ServerFailure(
          statusCode: response.statusCode,
          body: response.body,
        ));
      } else {
        final responseBody = jsonDecode(response.body);
        return Result.success(AdviceDto.fromJson(responseBody));
      }
    } catch (error) {
      return Result.failure(UnknownFailure());
    }
  }
}
