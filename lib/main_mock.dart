import 'package:flutter/material.dart';
import 'package:flutter_baur/data/repositories/advice_repository_mock.dart';
import 'package:flutter_baur/domain/repositories/advice_repository.dart';
import 'package:flutter_baur/presentation/my_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider<AdviceRepository>(
        create: (context) => AdviceRepositoryMock(),
      ),
    ],
    child: const MyApp(),
  ));
}
