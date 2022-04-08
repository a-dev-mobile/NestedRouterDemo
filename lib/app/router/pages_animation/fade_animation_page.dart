import 'package:flutter/material.dart';
/// Convert widget in page
class FadeAnimationPage extends Page {
  ///
  const FadeAnimationPage({LocalKey? key, Widget? child})
      : _child = child,
        super(key: key);

  final Widget? _child;

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        final curveTween = CurveTween(curve: Curves.easeIn);

        return FadeTransition(
          opacity: animation.drive(curveTween),
          child: _child,
        );
      },
    );
  }
}
