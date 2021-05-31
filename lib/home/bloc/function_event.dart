part of 'function_bloc.dart';

abstract class FunctionEvent extends Equatable {
  const FunctionEvent();

  @override
  List<Object> get props => [];
}

class FunctionRunButtonPressedEvent extends FunctionEvent {}

class FunctionSaveButtonPressedEvent extends FunctionEvent {
  FunctionSaveButtonPressedEvent({required this.file});
  final File file;

  @override
  List<Object> get props => [file];
}
