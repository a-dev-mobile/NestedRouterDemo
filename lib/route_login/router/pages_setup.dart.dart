// ignore_for_file: public_member_api_docs

// Приведенные  константы определяют пути или маршруты каждого экрана.
import 'package:flutter/foundation.dart';
import 'package:nes_route/route_login/app_state.dart';


const String splashPath = '/splash';
const String loginPath = '/login';
const String createAccountPath = '/createAccount';
const String listItemsPath = '/listItems';
const String detailsPath = '/details';
const String cartPath = '/cart';
const String checkoutPath = '/checkout';
const String settingsPath = '/settings';

enum Pages {
  splash,
  login,
  createAccount,
  list,
  details,
  cart,
  checkout,
  settings,
}

class PageConfiguration {
  PageConfiguration({
    required this.key,
    required this.path,
    required this.uiPage,
    this.currentPageAction,
  });
  final String key;
  final String path;
  final Pages uiPage;

  PageAction? currentPageAction;
}

final PageConfiguration splashPageConfig = PageConfiguration(
  key: 'splash',
  path: splashPath,
  uiPage: Pages.splash,
);
final PageConfiguration loginPageConfig = PageConfiguration(
  key: 'login',
  path: loginPath,
  uiPage: Pages.login,
);
final PageConfiguration createAccountPageConfig = PageConfiguration(
  key: 'createAccount',
  path: createAccountPath,
  uiPage: Pages.createAccount,
);
final PageConfiguration listItemsPageConfig = PageConfiguration(
  key: 'listItems',
  path: listItemsPath,
  uiPage: Pages.list,
);
final PageConfiguration detailsPageConfig = PageConfiguration(
  key: 'details',
  path: detailsPath,
  uiPage: Pages.details,
);
final PageConfiguration cartPageConfig = PageConfiguration(
  key: 'cart',
  path: cartPath,
  uiPage: Pages.cart,
);
final PageConfiguration checkoutPageConfig = PageConfiguration(
  key: 'checkout',
  path: checkoutPath,
  uiPage: Pages.checkout,
);
final PageConfiguration settingsPageConfig = PageConfiguration(
  key: 'settings',
  path: settingsPath,
  uiPage: Pages.settings,
);
