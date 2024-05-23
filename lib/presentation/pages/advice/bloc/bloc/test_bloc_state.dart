part of 'test_bloc_bloc.dart';

sealed class TestBlocState extends Equatable {
  const TestBlocState();
  
  @override
  List<Object> get props => [];
}

final class TestBlocInitial extends TestBlocState {}
