import 'package:flutter/material.dart';
import 'package:nes_route/model/models.dart';

class AppState extends ChangeNotifier {
  AppState() : _selectedIndex = 0;

  final List<Book> books = [
    Book('Stranger in a Strange Land', 'Robert A. Heinlein'),
    Book('Foundation', 'Isaac Asimov'),
    Book('Fahrenheit 451', 'Ray Bradbury'),
  ];

  int get selectedIndex => _selectedIndex;
  Book? _selectedBook;
  int _selectedIndex;

  set selectedIndex(int idx) {
    _selectedIndex = idx;
    if (_selectedIndex == 1) {
      // Удалите эту строку, если вы хотите сохранить 
      //выбранную книгу при переходе между "настройками" и "дом" 
      //какая книга была выбрана при нажатии кнопки Настройки.
      // selectedBook = null;
    }
    notifyListeners();
  }

  Book? get selectedBook => _selectedBook;

  set selectedBook(Book? book) {
    _selectedBook = book;
    notifyListeners();
  }

  int getSelectedBookById() {
    if (!books.contains(_selectedBook)) return 0;
    
    return books.indexOf(_selectedBook!);
  }

  void setSelectedBookById(int id) {
    if (id < 0 || id > books.length - 1) {
      return;
    }

    _selectedBook = books[id];
    notifyListeners();
  }
}
