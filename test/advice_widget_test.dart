// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_baur/presentation/pages/advice/advice_page.dart';
import 'package:flutter_baur/presentation/pages/advice/cubit/advice_cubit.dart';
import 'package:flutter_baur/presentation/pages/advice/cubit/advice_cubit_state.dart';
import 'package:flutter_baur/presentation/pages/advice/widgets/advice_field.dart';
import 'package:flutter_baur/presentation/pages/advice/widgets/error_message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class MockAdviceCubit extends MockCubit<AdviceCubitState> implements AdviceCubit {}

void main() {
  Widget widgetUnderTest({AdviceCubit? cubit, AdviceCubitState? state}) {
    return MaterialApp(
      home: BlocProvider<AdviceCubit>(
        create: (context) => cubit ?? AdviceCubit(defaultState: state),
        child: const AdvicePage(),
      ),
    );
  }

  late AdviceCubit mockAdviceCubit;

  setUp(() {
    mockAdviceCubit = MockAdviceCubit();
  });
  group('AdvicePage', () {
    testWidgets('should show loaded state', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(widgetUnderTest(state: const AdviceLoadedState(advice: 'loaded state')));

      expect(find.text('loaded state'), findsOneWidget);
      expect(find.byType(AdviceField), findsOneWidget);
    });

    testWidgets('should show loading state', (WidgetTester tester) async {
      await tester.pumpWidget(widgetUnderTest(state: const AdviceLoadingState()));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });

  testWidgets(
    'should show error state',
    (widgetTester) async {
      whenListen(
        mockAdviceCubit,
        Stream.fromIterable(const [AdviceErrorState(error: 'error')]),
        initialState: const AdviceEmptyState(),
      );

      await widgetTester.pumpWidget(widgetUnderTest(cubit: mockAdviceCubit));
      await widgetTester.pump();

      final advicerErrorFinder = find.byType(ErrorMessage);

      expect(advicerErrorFinder, findsOneWidget);
    },
  );
}
