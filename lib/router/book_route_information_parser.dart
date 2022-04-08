import 'package:flutter/material.dart';
import 'package:nes_route/router/routes.dart';

class BookRouteInformationParser extends RouteInformationParser<BookRoutePath> {
  @override
  Future<BookRoutePath> parseRouteInformation(
      RouteInformation routeInformation,) async {
    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isNotEmpty && uri.pathSegments.first == 'settings') {
      return BooksSettingsPath();
    } else {
      if (uri.pathSegments.length >= 2) {
        if (uri.pathSegments.first == 'book') {
          return BooksDetailsPath(int.tryParse(uri.pathSegments[1])!);
        }
      }
      
      return BooksListPath();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(BookRoutePath configuration) {
    if (configuration is BooksListPath) {
      return const RouteInformation(location: '/home');
    }
    if (configuration is BooksSettingsPath) {
      return const RouteInformation(location: '/settings');
    }
    if (configuration is BooksDetailsPath) {
      return RouteInformation(location: '/book/${configuration.id}');
    }
    
    return null;
  }
}
