import 'package:flutter/material.dart';
import 'package:nes_route/router/book_app_state.dart';
import 'package:nes_route/router/routes.dart';
import 'package:nes_route/screen/app_shell.dart';

class BookRouterDelegate extends RouterDelegate<BookRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<BookRoutePath> {
  BookRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>() {
    appState.addListener(notifyListeners);
  }
  BooksAppState appState = BooksAppState();

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  BookRoutePath get currentConfiguration {
    return appState.selectedIndex == 1
        ? BooksSettingsPath()
        : appState.selectedBook == null
            ? BooksListPath()
            : BooksDetailsPath(appState.getSelectedBookById());
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          child: AppShell(appState: appState),
        ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        if (appState.selectedBook != null) {
          appState.selectedBook = null;
        }
        notifyListeners();
        
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(BookRoutePath configuration) async {
    if (configuration is BooksListPath) {
      appState.selectedIndex = 0;
      appState.selectedBook = null;
    } else if (configuration is BooksSettingsPath) {
      appState.selectedIndex = 1;
    } else if (configuration is BooksDetailsPath) {
      appState.setSelectedBookById(configuration.id);
    }
  }
}
