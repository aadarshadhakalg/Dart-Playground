import 'package:dartcompiler/home/views/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dart Compiler'),
      ),
      drawer: const Drawer(
        child: AppDrawer(),
      ),
      body: Container(),
    );
  }
}
