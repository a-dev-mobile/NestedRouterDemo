// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_route/route_login/app_state.dart';
import 'package:nes_route/route_login/router/pages_setup.dart.dart';
import 'package:nes_route/route_login/router/route_parser.dart';

import 'package:nes_route/route_login/router/router_delegate.dart';

import 'package:provider/provider.dart';



void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  _AppState() {
    delegate = AppRouterDelegate(appState);
    delegate.setNewRoutePath(splashPageConfig);
  }

  final appState = AppState();
  late AppRouterDelegate delegate;
  final parser = AppRouteParser();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (_) => appState,
      child: MaterialApp.router(
        title: 'Navigation App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routerDelegate: delegate,
        routeInformationParser: parser,
      ),
    );
  }
}
