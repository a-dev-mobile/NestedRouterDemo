import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nes_route/tab_and_nested_nav_2/app/router/app_route_path.dart';
import 'package:nes_route/tab_and_nested_nav_2/app/router/app_state.dart';
import 'package:nes_route/tab_and_nested_nav_2/app/router/pages_animation/fade_animation_page.dart';
import 'package:nes_route/tab_and_nested_nav_2/core/services/services.dart';
import 'package:nes_route/tab_and_nested_nav_2/model/models.dart';
import 'package:nes_route/tab_and_nested_nav_2/screen/view/credit_screen.dart';

import 'package:nes_route/tab_and_nested_nav_2/screen/view/screen.dart';

///
class InnerRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  ///
  InnerRouterDelegate(AppState appState) : _appState = appState;

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  AppState get appState => _appState;
  AppState _appState;
  set appState(AppState value) {
    if (value == _appState) {
      return;
    }
    _appState = value;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    final indexTab = appState.selectedIndex;

    return Navigator(
      key: navigatorKey,
      pages: [
        // 1 tab
        if (indexTab == 0) ...[
          _booksListPage(),
          if (appState.selectedBook != null) _bookDetailsPage(),
          // 2 tab
        ] else if (indexTab == 1)
          _settingPage()
        // 3 tab
        else if (indexTab == 2)
          _creditPage(),
      ],
      onPopPage: (route, result) => _onPopPage(route, result),
    );
  }

  /// добавить регулируемый возврат
  bool _onPopPage(Route route, result) {
    log.i('2return route.didPop(result); ${route}');
    log.i('2return route.didPop(result);');
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

  Page _creditPage() {
    return const FadeAnimationPage(
      child: CreditScreen(),
      key: ValueKey('CreditPage'),
    );
  }

  Page _bookDetailsPage() {
    return CupertinoPage(
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
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    // Это не требуется для внутреннего делегата маршрутизатора, поскольку он не анализирует маршрут
    assert(false);
  }

  void _handleBookTapped(Book book) {
    appState.selectedBook = book;
    notifyListeners();
  }
}
