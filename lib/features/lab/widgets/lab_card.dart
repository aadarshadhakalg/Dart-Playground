import 'package:flutter/material.dart';
import 'package:learndart/global/ui/app_icon_button.dart';

class LabCard extends StatelessWidget {
  const LabCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: [
          ...[1, 2, 3, 4, 5]
              .map(
                (e) => Container(
                  margin: e != 5 ? const EdgeInsets.only(right: 20) : null,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: kMaterialEdges[MaterialType.card],
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/lab_placeholder.png',
                              height: 100,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Variables',
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Time: 5 min',
                              style: Theme.of(context).textTheme.caption,
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: AppIconButton(
                          icon: Icons.play_arrow,
                          color: Theme.of(context).primaryColor,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
