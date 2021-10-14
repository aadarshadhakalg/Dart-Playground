import 'package:flutter/material.dart';
import 'package:learndart/global/theme.dart';

import 'features/home/home_page.dart';

void main() {
  runApp(const LearnDart());
}

class LearnDart extends StatelessWidget {
  const LearnDart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: const HomePage(),
    );
  }
}
