import 'package:flutter/material.dart';
import 'package:learndart/features/classroom/views/chapters.dart';
import 'package:learndart/features/home/views/widgets/daily_tips.dart';
import 'package:learndart/features/lab/widgets/lab_card.dart';
import 'package:learndart/global/ui/app_icon_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          primary: true,
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('LearnDart'),
          actions: [
            AppIconButton(onTap: () {}, icon: Icons.info_outline),
            const SizedBox(
              width: 10,
            ),
            AppIconButton(onTap: () {}, icon: Icons.code),
            const SizedBox(
              width: 10,
            ),
          ],
          expandedHeight: 420,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.none,
            background: Padding(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: kToolbarHeight,
                  ),
                  DailyTips(
                      title: 'Learn about spread operators.', onTap: () {}),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Practice Labs',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 18,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const LabCard(),
                ],
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Chapters',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Theme.of(context).primaryColor,
                        size: 18,
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: ChaptersWidget(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
