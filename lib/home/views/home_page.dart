import 'package:dartcompiler/global/services/archive_service.dart';
import 'package:dartcompiler/home/bloc/function_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:code_editor/code_editor.dart';

import 'widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final ArchiveService archiveService = ArchiveService.getInstance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dart Compiler'),
      ),
      drawer: const Drawer(
        child: AppDrawer(),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FutureBuilder(
                future: archiveService.getCurrentCode(),
                builder: (context, snapshot) {
                  return CodeEditor(
                    disableNavigationbar: true,
                    edit: false,
                    model: EditorModel(
                      styleOptions: EditorModelStyleOptions(
                        heightOfContainer:
                            MediaQuery.of(context).size.height - 180,
                      ),
                      files: [
                        FileEditor(
                          name: 'main.dart',
                          language: 'dart',
                          code: snapshot.data != null
                              ? snapshot.data.toString()
                              : '',
                        ),
                      ],
                    ),
                    onSubmit: (String? language, String? value) async {
                      await ArchiveService.getInstance.writeCounter(value!);
                      try {
                        var file =
                            await ArchiveService.getInstance.getTarFile();
                        BlocProvider.of<FunctionBloc>(context).add(
                          FunctionSaveButtonPressedEvent(
                            file: file!,
                          ),
                        );
                      } catch (e) {
                        print(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Error Occurred'),
                          ),
                        );
                      }
                    },
                  );
                }),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<FunctionBloc>(context).add(
                    FunctionRunButtonPressedEvent(),
                  );
                  showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return BlocProvider.value(
                          value: BlocProvider.of<FunctionBloc>(context),
                          child: Container(
                            color: Colors.black87,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(3.0),
                                  child: Text(
                                    'Output',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                const Divider(color: Colors.white),
                                Container(
                                  height: 200,
                                  child:
                                      BlocBuilder<FunctionBloc, FunctionState>(
                                    builder: (context, state) {
                                      if (state
                                          is FunctionExecutionRunningState) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else if (state
                                          is FunctionExecutionErrorState) {
                                        return Text(
                                          state.message,
                                          style: const TextStyle(
                                            color: Colors.red,
                                          ),
                                        );
                                      } else if (state
                                          is FunctionExecutionSuccessState) {
                                        return Text(
                                          state.message ?? 'Unknown Error',
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        );
                                      } else {
                                        return Container();
                                      }
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: const Text('Run'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
