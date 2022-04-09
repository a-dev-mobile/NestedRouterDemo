import 'package:flutter/material.dart';

import 'navigation/main_routee_delegate.dart';
import 'navigation/main_routee_information_parser.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final MainRouterDelegate _mainRouterDelegate = MainRouterDelegate();
  final MainRouteInformationParser _mainRouteInformationParser =
      MainRouteInformationParser();
  @override
  void dispose() {
    _mainRouterDelegate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _mainRouteInformationParser,
      routerDelegate: _mainRouterDelegate,
    );
  }
}
