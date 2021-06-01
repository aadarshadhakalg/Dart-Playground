import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartcompiler/authentication/repositories/user_repository.dart';
import 'package:dartcompiler/home/repositories/function_collection_repository.dart';
import 'package:dartcompiler/home/repositories/functions_repositories.dart';
import 'package:equatable/equatable.dart';

part 'function_event.dart';
part 'function_state.dart';

class FunctionBloc extends Bloc<FunctionEvent, FunctionState> {
  FunctionBloc() : super(FunctionInitialState()) {
    functionCollectionRepository = FunctionCollectionRepository.getInstance;
    functionsRepository = FunctionsRepository.getInstance;
    userRepository = UserRepository.getInstance;
  }
  late final FunctionCollectionRepository functionCollectionRepository;
  late final FunctionsRepository functionsRepository;
  late final UserRepository userRepository;

  @override
  Stream<FunctionState> mapEventToState(
    FunctionEvent event,
  ) async* {
    if (event is FunctionSaveButtonPressedEvent) {
      var fid = await functionCollectionRepository
          .getFunctionId(userRepository.currentUser!.id);
      await functionsRepository.deployTag(
          fid!, 'dart main.dart', event.file.path);
    } else if (event is FunctionRunButtonPressedEvent) {
      yield FunctionExecutionRunningState();
      try{
      var fid = await functionCollectionRepository
          .getFunctionId(userRepository.currentUser!.id);
      var eid = await functionsRepository.executeFunctions(fid!);
      var result = await functionsRepository.getExecution(fid, eid!);
      yield FunctionExecutionSuccessState(message: result);
      } catch (e){
        yield FunctionExecutionErrorState(message: 'Error: $e');
      }
    }
  }
}
