import 'package:flutter/material.dart';
import 'package:nes_route/tab_and_nested_nav_2/app/router/app_route_information_parser.dart';
import 'package:nes_route/tab_and_nested_nav_2/app/router/app_router_delegate.dart';

///
class App extends StatefulWidget {
  ///
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final AppRouterDelegate _routerDelegate = AppRouterDelegate();
  final AppRouteInformationParser _routeInformationParser =
      AppRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Books App',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}
