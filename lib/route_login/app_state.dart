// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_route/route_login/router/pages_setup.dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String LoggedInKey = 'LoggedIn';

enum PageState {
  none,
  addPage,
  addAll,
  addWidget,
  pop,
  replace,
  replaceAll,
}

class PageAction {
  PageAction({
    this.state = PageState.none,
    this.pageConfig,
    this.pages,
    this.widget,
  });

  PageState state;
  PageConfiguration? pageConfig;
  List<PageConfiguration>? pages;
  Widget? widget;
}

class AppState extends ChangeNotifier {
  AppState() {
    getLoggedInState();
  }

  final cartItems = [];
  String emailAddress = '';
  String password = '';

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  bool _splashFinished = false;
  bool get splashFinished => _splashFinished;

  PageAction _currentAction = PageAction();
  PageAction get currentAction => _currentAction;

  set currentAction(PageAction action) {
    _currentAction = action;
    notifyListeners();
  }

  void resetCurrentAction() {
    _currentAction = PageAction();
  }

  void addToCart(String item) {
    cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(String item) {
    cartItems.add(item);
    notifyListeners();
  }

  void clearCart() {
    cartItems.clear();
    notifyListeners();
  }

  void setSplashFinished() {
    _splashFinished = true;
    _currentAction = _loggedIn
        ? PageAction(
            state: PageState.replaceAll,
            pageConfig: listItemsPageConfig,
          )
        : PageAction(state: PageState.replaceAll, pageConfig: loginPageConfig);
    notifyListeners();
  }

  void login() {
    _loggedIn = true;
    saveLoginState(loggedIn: loggedIn);
    _currentAction = PageAction(
      state: PageState.replaceAll,
      pageConfig: listItemsPageConfig,
    );
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    saveLoginState(loggedIn: loggedIn);
    _currentAction =
        PageAction(state: PageState.replaceAll, pageConfig: loginPageConfig);
    notifyListeners();
  }

// TODO переделать под мой SH

  Future<void> getLoggedInState() async {
    final prefs = await SharedPreferences.getInstance();
    _loggedIn = prefs.getBool(LoggedInKey) ?? false;
  }

  Future<void> saveLoginState({required bool loggedIn}) async {
    final prefs = await SharedPreferences.getInstance();
    final setBool = prefs.setBool(LoggedInKey, loggedIn);
    debugPrint('saveLoginState >>> $setBool');
  }
}
