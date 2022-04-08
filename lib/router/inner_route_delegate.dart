import 'package:flutter/material.dart';
import 'package:nes_route/model/models.dart';
import 'package:nes_route/pages_animation/fade_animation_page.dart';
import 'package:nes_route/router/book_app_state.dart';
import 'package:nes_route/router/routes.dart';
import 'package:nes_route/screen/view/screen.dart';

class InnerRouterDelegate extends RouterDelegate<BookRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<BookRoutePath> {
  InnerRouterDelegate(this._appState);

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  BooksAppState get appState => _appState;
  BooksAppState _appState;
  set appState(BooksAppState value) {
    if (value == _appState) {
      return;
    }
    _appState = value;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        if (appState.selectedIndex == 0) ...[
          _booksListPage(),
          if (appState.selectedBook != null) _bookDetailsPage(),
        ] else
          _settingPage(),
      ],
      onPopPage: (route, result) => _onPopPage(route, result),
    );
  }

  bool _onPopPage(Route route, result) {
    appState.selectedBook = null;
    notifyListeners();

    return route.didPop(result);
  }

  Page _settingPage() {
    return const FadeAnimationPage(
      child: SettingsScreen(),
      key: ValueKey('SettingsPage'),
    );
  }

  Page _bookDetailsPage() {
    return MaterialPage(
      key: ValueKey(appState.selectedBook),
      child: BookDetailsScreen(book: appState.selectedBook),
    );
  }

  Page _booksListPage() {
    return FadeAnimationPage(
      child: BooksListScreen(
        books: appState.books,
        onTapped: _handleBookTapped,
      ),
      key: const ValueKey('BooksListPage'),
    );
  }

  @override
  Future<void> setNewRoutePath(BookRoutePath configuration) async {
    // Это не требуется для внутреннего делегата маршрутизатора, поскольку он не анализирует маршрут
    assert(false);
  }

  void _handleBookTapped(Book book) {
    appState.selectedBook = book;
    notifyListeners();
  }
}
