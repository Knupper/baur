import 'package:flutter/material.dart';
import 'package:flutter_baur/data/data_sources/advice_remote_data_source.dart';
import 'package:flutter_baur/data/repositories/advice_repository_mock.dart';
import 'package:flutter_baur/data/repositories/advice_repository_rest.dart';
import 'package:flutter_baur/domain/repositories/advice_repository.dart';
import 'package:flutter_baur/presentation/my_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider<AdviceRepository>(
        create: (context) => AdviceRepositoryMock(
            // dataSource: AdviceRestApiDataSource(client: http.Client()),
            ),
      ),
    ],
    child: const MyApp(),
  ));
}
