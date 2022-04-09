// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

@immutable
abstract class AbstractRoutePath {
  const AbstractRoutePath();
}

/// Pre main screen paths
abstract class PreMainScreenPath extends AbstractRoutePath {
  const PreMainScreenPath();
}

class LoadingScreen1Path extends PreMainScreenPath {
  const LoadingScreen1Path();
}

class LoadingScreen2Path extends PreMainScreenPath {
  const LoadingScreen2Path();
}

///onboarding
class IntroScreenPath extends PreMainScreenPath {
  const IntroScreenPath();
}

class LoginScreenPath extends PreMainScreenPath {
  const LoginScreenPath();
}
