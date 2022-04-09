// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nes_route/custom/navigation/router_path.dart';
import 'package:nes_route/tab_and_nested_nav_2/core/services/services.dart';

class MainRouteInformationParser
    extends RouteInformationParser<AbstractRoutePath> {
  @override
  Future<AbstractRoutePath> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final uri = Uri.parse(routeInformation.location!);
    log.i(' 1 parseRouteInformation ${routeInformation.location!}');

    if (uri.pathSegments.isNotEmpty) {
      if (uri.pathSegments.first == 'loadingScreen1') {
        return const LoadingScreen1Path();
      } else if (uri.pathSegments.first == 'introScreen') {
        return IntroScreenPath();
      }
    }

    return const LoadingScreen1Path();
  }

  @override
  RouteInformation restoreRouteInformation(AbstractRoutePath path) {
    log.i('4 restoreRouteInformation ${path.runtimeType}');

    if (path is LoadingScreen1Path) {
      return RouteInformation(location: '/loadingScreen1');
    }
    if (path is IntroScreenPath) {
      return RouteInformation(location: '/introScreen');
    }

    print("NOT GOOD, UNKNOWN PATH");
    // todo replace this with error page or something

    return const RouteInformation(location: '/');
  }
}
