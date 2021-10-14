import 'package:flutter/material.dart';
import 'package:learndart/features/classroom/views/chapter_card.dart';

class ChaptersWidget extends StatelessWidget {
  const ChaptersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        ...[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
            .map(
              (e) => const ChapterCard(
                author: 'Creative Bracket',
                detail: 'hello_world',
                title: 'Hello World',
              ),
            )
            .toList()
      ],
    );
  }
}
