import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dart Compiler'),
      ),
      drawer: const Drawer(),
      body: Container(),
    );
  }
}
