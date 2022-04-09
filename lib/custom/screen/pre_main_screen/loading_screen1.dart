import 'package:flutter/material.dart';
import 'package:nes_route/custom/navigation/app_state.dart';
import 'package:nes_route/custom/navigation/router_path.dart';
import 'package:nes_route/tab_and_nested_nav_2/core/services/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingScreen1 extends StatefulWidget {
  const LoadingScreen1({Key? key}) : super(key: key);

  @override
  State<LoadingScreen1> createState() => _LoadingScreen1State();
}

class _LoadingScreen1State extends State<LoadingScreen1> {
  @override
  void initState() {
    super.initState();
    log.i("3 LoadingScreen1 Initialising app");
    _startupApp();
  }

  void _startupApp() async {
    // вся загрузка локальных данных shared_pref
    final Future<void> localStorageFuture = _loadDataFromLocalStorage();

    // Future<void> amplifyFuture = _configureAmplifyAndUpdateLoginStatus();
    final Future<void> minDelayFuture =
        Future.delayed(const Duration(milliseconds: 1500));
    final Future<void> minDelayFuture2 =
        Future.delayed(const Duration(milliseconds: 5500));
    final List<Future<void>> finishOnLoadingScreenFutures = [];

    finishOnLoadingScreenFutures.add(localStorageFuture);
    finishOnLoadingScreenFutures.add(minDelayFuture);
    finishOnLoadingScreenFutures.add(minDelayFuture2);

    // выжидаем когда все листы future загрузятся
    final list = await Future.wait(finishOnLoadingScreenFutures);
    log.i('list.toString() ${list.toString()}');
    _navigateToNextScreen();
    log.i(
      "Загрузка данных из локального хранилища и минимальная задержка выполнена",
    );
  }

  /// прыжок если все загрузилось и пользователь за логинен >>> на home screen
  _handleDataLoaded(AppState appState) async {}

  /// Loads user defined categories.
  Future<void> _loadDataFromLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    //use_build_context_synchronously
    final AppState appState = _getAppState();
    // user settings
    bool isFirstLogin = prefs.getBool('isFirstLogin') ?? true;
    appState.isFirstLogin = isFirstLogin;

    // admin settings

    log.i("Data from local storage loaded.");
  }

  AppState _getAppState() => Provider.of<AppState>(context, listen: false);

  void _navigateToNextScreen() {
    //  It is an error to call [setState] unless [mounted] is true.
    if (!mounted) return;
    bool isShowIntro = _getAppState().isShowIntro;
    AbstractRoutePath newPath;

    newPath = isShowIntro ? const IntroScreenPath() : const LoginScreenPath();

    _getAppState().currentRoutePath = newPath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'LoadingScreen1',
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('LoadingScreen1'),
      ),
    );
  }
}
