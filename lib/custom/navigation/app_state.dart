// ignore_for_file: public_member_api_docs

import 'package:flutter/foundation.dart';
import 'package:nes_route/custom/navigation/router_path.dart';

class AppState extends ChangeNotifier {
  AbstractRoutePath _currentRoutePath = LoadingScreen1Path();
  
  AbstractRoutePath get currentRoutePath => _currentRoutePath;

  bool isShowIntro = true;
  bool isFirstLogin = true;
  bool get isDataLoading => _isDataLoading;


  set currentRoutePath(AbstractRoutePath newRoutePath) {
    _currentRoutePath = newRoutePath;
    notifyListeners();
  }

  bool _isDataLoading = true;
}
