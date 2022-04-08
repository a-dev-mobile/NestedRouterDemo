import 'package:flutter/material.dart';
import 'package:nes_route/router/book_route_information_parser.dart';
import 'package:nes_route/router/book_router_delegate.dart';

void main() {
  runApp(const NestedRouterDemo());
}

class NestedRouterDemo extends StatefulWidget {
  const NestedRouterDemo({Key? key}) : super(key: key);

  @override
  _NestedRouterDemoState createState() => _NestedRouterDemoState();
}

class _NestedRouterDemoState extends State<NestedRouterDemo> {
  final BookRouterDelegate _routerDelegate = BookRouterDelegate();
  final BookRouteInformationParser _routeInformationParser =
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
