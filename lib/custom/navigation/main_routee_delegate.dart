// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nes_route/custom/navigation/router_path.dart';
import 'package:nes_route/custom/screen/pre_main_screen/intro_screen.dart';
import 'package:nes_route/custom/screen/pre_main_screen/loading_screen1.dart';
import 'package:provider/provider.dart';

import '../../tab_and_nested_nav_2/core/services/services.dart';
import 'app_state.dart';

class MainRouterDelegate extends RouterDelegate<AbstractRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AbstractRoutePath> {
  MainRouterDelegate() {
    _appState.addListener(notifyListeners);
  }
  @override
  void dispose() {
    _appState.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final AppState _appState = AppState();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (context) => _appState,
      child: Navigator(
        key: navigatorKey,
        pages: getPage(),
        onPopPage: (route, result) => popPage(route, result),
      ),
    );
  }

  bool popPage(Route route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    return true;
  }

  List<Page> getPage() {
    log.i(
      ' 2 _appState.currentRoutePath.runtimeType \n ${_appState.currentRoutePath.runtimeType}',
    );

    return [
      if (_appState.currentRoutePath is LoadingScreen1Path)
        const MaterialPage(child: LoadingScreen1()),
      if (_appState.currentRoutePath is IntroScreenPath)
        const MaterialPage(child: IntroScreen()),
    ];
  }

  @override
  AbstractRoutePath get currentConfiguration {
      log.i(
      ' 5 currentConfiguration \n ${_appState.currentRoutePath.runtimeType}',
    );
    
    return _appState.currentRoutePath;
  }
  @override
  Future<void> setNewRoutePath(AbstractRoutePath configuration) {
    log.i(
      ' 3 setNewRoutePath \n ${configuration.runtimeType}',
    );
    _appState.currentRoutePath = configuration;

    return SynchronousFuture<void>(null);
  }
}
