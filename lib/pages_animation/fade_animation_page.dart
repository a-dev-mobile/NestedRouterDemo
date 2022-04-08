import 'package:flutter/material.dart';

class FadeAnimationPage extends Page {
  const FadeAnimationPage({LocalKey? key, this.child}) : super(key: key);
  final Widget? child;


  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        final curveTween = CurveTween(curve: Curves.easeIn);
        
        return FadeTransition(
          opacity: animation.drive(curveTween),
          child: child,
        );
      },
    );
  }
}
