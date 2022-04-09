// ignore_for_file: public_member_api_docs

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nes_route/route_login/router/pages_setup.dart.dart';
import 'package:nes_route/route_login/ui/cart.dart';
import 'package:nes_route/route_login/ui/checkout.dart';
import 'package:nes_route/route_login/ui/create_account.dart';
import 'package:nes_route/route_login/ui/details.dart';
import 'package:nes_route/route_login/ui/list_items.dart';
import 'package:nes_route/route_login/ui/login.dart';
import 'package:nes_route/route_login/ui/settings.dart';
import 'package:nes_route/route_login/ui/splash.dart';

import '../app_state.dart';

class AppRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {
  AppRouterDelegate(this.appState)
      : navigatorKey = GlobalKey<NavigatorState>() {
    appState.addListener(notifyListeners);
  }

  @override
  GlobalKey<NavigatorState> navigatorKey;
  final AppState appState;

  final List<Page> _pages = [];

  /// Getter for a list that cannot be changed
  List<MaterialPage> get pages => List.unmodifiable(_pages);

  /// Number of pages function
  int numPages() => _pages.length;

  @override
  PageConfiguration get currentConfiguration =>
      _pages.last.arguments! as PageConfiguration;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      // onPopPage: _onPopPage,
      pages: buildPages(),
    );
  }

  MaterialPage _createPage(Widget child, PageConfiguration pageConfig) {
    return MaterialPage(
      child: child,
      key: ValueKey(pageConfig.key),
      name: pageConfig.path,
      arguments: pageConfig,
    );
  }

  void _addPageData(Widget child, PageConfiguration pageConfig) {
    _pages.add(
      _createPage(child, pageConfig),
    );
  }

  void addPage(PageConfiguration pageConfig) {
    final shouldAddPage = _pages.isEmpty ||
        (_pages.last.arguments as PageConfiguration).uiPage !=
            pageConfig.uiPage;
    if (shouldAddPage) {
      switch (pageConfig.uiPage) {
        case Pages.splash:
          _addPageData(Splash(), splashPageConfig);
          break;
        case Pages.login:
          _addPageData(Login(), loginPageConfig);
          break;
        case Pages.createAccount:
          _addPageData(CreateAccount(), createAccountPageConfig);
          break;
        case Pages.list:
          _addPageData(ListItems(), listItemsPageConfig);
          break;
        case Pages.cart:
          _addPageData(Cart(), cartPageConfig);
          break;
        case Pages.checkout:
          _addPageData(Checkout(), checkoutPageConfig);
          break;
        case Pages.settings:
          _addPageData(Settings(), settingsPageConfig);
          break;
        case Pages.details:
          if (pageConfig.currentPageAction != null) {
            _addPageData(pageConfig.currentPageAction!.widget!, pageConfig);
          }
          break;
        default:
          break;
      }
    }
  }

  void replace(PageConfiguration newRoute) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    addPage(newRoute);
  }

  void pop() {
    if (canPop()) {
      _removePage(_pages.last);
    }
  }

  void _removePage(Page page) {
    final remove = _pages.remove(page);
  }

  bool canPop() {
    return _pages.length > 1;
  }

  void setPath(List<MaterialPage> path) {
    _pages.clear();
    _pages.addAll(path);
  }

  void replaceAll(PageConfiguration newRoute) {
    setNewRoutePath(newRoute);
  }

  void push(PageConfiguration newRoute) {
    addPage(newRoute);
  }

  void pushWidget(Widget child, PageConfiguration newRoute) {
    _addPageData(child, newRoute);
  }

  void addAll(List<PageConfiguration> routes) {
    _pages.clear();
    for (final route in routes) {
      addPage(route);
    }
  }

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) {
    final shouldAddPage = _pages.isEmpty ||
        (_pages.last.arguments as PageConfiguration).uiPage !=
            configuration.uiPage;
    if (shouldAddPage) {
      _pages.clear();
      addPage(configuration);
    }

    return SynchronousFuture(null);
  }

  void _setPageAction(PageAction action) {
    switch (action.pageConfig!.uiPage) {
      case Pages.splash:
        splashPageConfig.currentPageAction = action;
        break;
      case Pages.login:
        loginPageConfig.currentPageAction = action;
        break;
      case Pages.createAccount:
        createAccountPageConfig.currentPageAction = action;
        break;
      case Pages.list:
        listItemsPageConfig.currentPageAction = action;
        break;
      case Pages.cart:
        cartPageConfig.currentPageAction = action;
        break;
      case Pages.checkout:
        checkoutPageConfig.currentPageAction = action;
        break;
      case Pages.settings:
        settingsPageConfig.currentPageAction = action;
        break;
      case Pages.details:
        detailsPageConfig.currentPageAction = action;
        break;
      default:
        break;
    }
  }

  List<Page> buildPages() {
    if (!appState.splashFinished) {
      replaceAll(splashPageConfig);
    } else {
      switch (appState.currentAction.state) {
        case PageState.none:
          break;
        case PageState.addPage:
          _setPageAction(appState.currentAction);
          addPage(appState.currentAction.pageConfig!);
          break;
        case PageState.pop:
          pop();
          break;
        case PageState.replace:
          _setPageAction(appState.currentAction);
          replace(appState.currentAction.pageConfig!);
          break;
        case PageState.replaceAll:
          _setPageAction(appState.currentAction);
          replaceAll(appState.currentAction.pageConfig!);
          break;
        case PageState.addWidget:
          _setPageAction(appState.currentAction);
          pushWidget(
            appState.currentAction.widget!,
            appState.currentAction.pageConfig!,
          );
          break;
        case PageState.addAll:
          addAll(appState.currentAction.pages!);
          break;
      }
    }
    appState.resetCurrentAction();

    return List.of(_pages);
  }

  void parseRoute(Uri uri) {
    if (uri.pathSegments.isEmpty) {
      setNewRoutePath(splashPageConfig);

      return;
    }

    // Handle navapp://deeplinks/details/#
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] == 'details') {
        pushWidget(Details(int.parse(uri.pathSegments[1])), detailsPageConfig);
      }
    } else if (uri.pathSegments.length == 1) {
      final path = uri.pathSegments.first;
      switch (path) {
        case 'splash':
          replaceAll(splashPageConfig);
          break;
        case 'login':
          replaceAll(loginPageConfig);
          break;
        case 'createAccount':
          setPath([
            _createPage(Login(), loginPageConfig),
            _createPage(CreateAccount(), createAccountPageConfig),
          ]);
          break;
        case 'listItems':
          replaceAll(listItemsPageConfig);
          break;
        case 'cart':
          setPath([
            _createPage(ListItems(), listItemsPageConfig),
            _createPage(Cart(), cartPageConfig),
          ]);
          break;
        case 'checkout':
          setPath([
            _createPage(ListItems(), listItemsPageConfig),
            _createPage(Checkout(), checkoutPageConfig),
          ]);
          break;
        case 'settings':
          setPath([
            _createPage(ListItems(), listItemsPageConfig),
            _createPage(Settings(), settingsPageConfig),
          ]);
          break;
      }
    }
  }
}
