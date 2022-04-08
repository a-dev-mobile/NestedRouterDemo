import 'package:flutter/material.dart';
import 'package:nes_route/tab_and_nested/app/router/app_route_path.dart';
import 'package:nes_route/tab_and_nested/core/services/services.dart';

///
class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final uri = Uri.parse(routeInformation.location!);

    // handle setting tab
    if (uri.pathSegments.isNotEmpty && uri.pathSegments.first == 'settings') {
      return AppSettingsPath();
      // handle credit tab
    } else if (uri.pathSegments.isNotEmpty &&
        uri.pathSegments.first == 'credit') {
      return AppCreditPath();
      // handle home/book/...
    } else {
      if (uri.pathSegments.length >= 2) {
        if (uri.pathSegments.first == 'book') {
          return AppDetailsPath(id: int.tryParse(uri.pathSegments[1])!);
        }
      }

      return AppHomePath();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(AppRoutePath configuration) {
    if (configuration is AppHomePath) {
      return const RouteInformation(location: '/home');
    }
    if (configuration is AppSettingsPath) {
      return const RouteInformation(location: '/settings');
    }

    if (configuration is AppCreditPath) {
      return const RouteInformation(location: '/credit');
    }
    if (configuration is AppDetailsPath) {
      return RouteInformation(location: '/book/${configuration.id}');
    }

    return null;
  }
}
