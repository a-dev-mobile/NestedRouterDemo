import 'package:flutter/material.dart';
import 'package:nes_route/model/models.dart';
import 'package:nes_route/router/book_app_state.dart';
import 'package:nes_route/router/book_route_information_parser.dart';
import 'package:nes_route/router/book_router_delegate.dart';
import 'package:nes_route/router/inner_route_delegate.dart';

void main() {
  runApp(NestedRouterDemo());
}

class NestedRouterDemo extends StatefulWidget {
  @override
  _NestedRouterDemoState createState() => _NestedRouterDemoState();
}

class _NestedRouterDemoState extends State<NestedRouterDemo> {
  BookRouterDelegate _routerDelegate = BookRouterDelegate();
  BookRouteInformationParser _routeInformationParser =
      BookRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Books App',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}




