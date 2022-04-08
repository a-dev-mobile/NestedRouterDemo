import 'package:flutter/material.dart';
import 'package:nes_route/tab_and_nested_nav_2/app/router/app_route_path.dart';
import 'package:nes_route/tab_and_nested_nav_2/app/router/app_state.dart';
import 'package:nes_route/tab_and_nested_nav_2/core/services/services.dart';

import 'package:nes_route/tab_and_nested_nav_2/screen/app_shell.dart';

///
class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  ///
  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>() {
    _appState.addListener(notifyListeners);
  }

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppState _appState = AppState();

  ///
  @override
  AppRoutePath get currentConfiguration {
    final int selectedIndex = _appState.selectedIndex;
    if (selectedIndex == 0) {
      // home
      if (_appState.selectedBook == null) {
        return AppHomePath();
      }

      // home / book / ....
      if (_appState.selectedBook != null) {
        return AppDetailsPath(id: _appState.getSelectedBookById());
      }

      return AppDetailsPath(id: _appState.getSelectedBookById());
    }
    // setting
    if (selectedIndex == 1) return AppSettingsPath();
    // credit
    if (selectedIndex == 2) return AppCreditPath();

    return AppHomePath();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          child: AppShell(appState: _appState),
        ),
      ],
      onPopPage: (route, result) {
        log.i('1return route.didPop(result);');

        if (!route.didPop(result)) {
          return false;
        }

        if (_appState.selectedBook != null) {
          _appState.selectedBook = null;
        }
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    if (configuration is AppHomePath) {
      _appState.selectedIndex = 0;
      _appState.selectedBook = null;
    } else if (configuration is AppSettingsPath) {
      _appState.selectedIndex = 1;
    } else if (configuration is AppCreditPath) {
      _appState.selectedIndex = 2;
    } else if (configuration is AppDetailsPath) {
      _appState.setSelectedBookById(configuration.id);
    }
  }
}
