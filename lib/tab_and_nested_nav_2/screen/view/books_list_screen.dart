import 'package:flutter/material.dart';
import 'package:nes_route/tab_and_nested_nav_2/model/book.dart';

class BooksListScreen extends StatelessWidget {
  const BooksListScreen({
    Key? key,
    required this.books,
    required this.onTapped,
  }) : super(key: key);

  final List<Book> books;
  final ValueChanged<Book> onTapped;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BooksListScreen',
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          for (var book in books)
            ListTile(
              title: Text(book.title),
              subtitle: Text(book.author),
              onTap: () => onTapped(book),
            ),
        ],
      ),
    );
  }
}
