part of 'function_bloc.dart';

abstract class FunctionState extends Equatable {
  const FunctionState();

  @override
  List<Object> get props => [];
}

class FunctionInitialState extends FunctionState {}

class FunctionExecutionRunningState extends FunctionState {}

class FunctionExecutionSuccessState extends FunctionState {
  FunctionExecutionSuccessState({required this.message});
   final String? message;

  @override
  List<Object> get props => [];
}

class FunctionExecutionErrorState extends FunctionState {
  FunctionExecutionErrorState({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
