import 'package:flutter/material.dart';
import 'package:learndart/global/ui/app_icon_button.dart';

class ChapterCard extends StatelessWidget {
  const ChapterCard({
    Key? key,
    required this.author,
    required this.detail,
    required this.title,
  }) : super(key: key);

  final String title;
  final String detail;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            AppIconButton(
              icon: Icons.chrome_reader_mode_outlined,
              color: const Color(0xFF0c8d98),
              onTap: () {},
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'by $author',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
