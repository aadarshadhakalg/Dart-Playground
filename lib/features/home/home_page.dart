import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:learndart/features/home/views/home_view.dart';
import 'package:learndart/features/home/views/widgets/bottom_bar_animation.dart';
import 'package:learndart/global/ui/app_icon_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeView(),
    );
  }
}
