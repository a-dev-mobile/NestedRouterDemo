import 'package:flutter/material.dart';
import 'package:nes_route/tab_and_nested_nav_2/model/models.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({
    Key? key,
    @required this.book,
  }) : super(key: key);

  final Book? book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BookDetailsScreen',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Back'),
            ),
            if (book != null) ...[
              Text(book!.title, style: Theme.of(context).textTheme.headline6),
              Text(book!.author, style: Theme.of(context).textTheme.subtitle1),
            ],
          ],
        ),
      ),
    );
  }
}
