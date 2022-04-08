import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
// ignore_for_file: prefer-single-widget-per-file


/// {@template AppTextButton}
/// A App UI Text Button.
///
/// ```dart
/// AppTextButton(
///   onPressed: () {
///     print('Tapped!');
///   },
///   child: Text('Button'),
/// )
/// ```
/// {@endtemplate}
class AppTextButton extends TextButton {
  /// {@macro AppTextButton}
  const AppTextButton({
    Key? key,
    ButtonStyle? style,
    required VoidCallback? onPressed,
    required Widget child,
  }) : super(
          key: key,
          style: style,
          onPressed: onPressed,
          child: child,
        );

  /// Create a text button from a pair of widgets that serve as the button's
  /// [icon] and [label].
  ///
  /// The icon and label are arranged in a row
  /// (column if you set direction = Axis.vertical)
  /// and padded by 8 logical pixels at the ends,
  ///  with an 8 pixel gap in between.
  ///
  /// The [icon] and [label] arguments must not be null.
  AppTextButton.icon({
    Key? key,
    ButtonStyle? style,
    required VoidCallback onPressed,
    required Widget icon,
    required Widget label,
    Axis? direction,
  }) : super(
          key: key,
          style: style,
          onPressed: onPressed,
          child: _AppButtonWithIconChild(
            icon: icon,
            label: label,
            direction: direction,
          ),
        );
}

/// {@template AppIconButton}
/// A App UI Icon Button.
///
/// ```dart
/// AppIconButton(
///   icon: Icon(Icons.settings),
///   onPressed: () {
///     print('Tapped!');
///   },
/// )
/// ```
/// {@endtemplate}

class AppIconButton extends IconButton {
  /// {@macro AppIconButton}
  const AppIconButton({
    Key? key,
    required Widget icon,
    required VoidCallback onPressed,
  }) : super(
          key: key,
          onPressed: onPressed,
          icon: icon,
        );
}

/// {@template FSOutlinedButton}
/// A App UI Outlined Button.
///
/// A material button with an outlined border.
///
/// ```dart
/// FSOutlinedButton(
///   child: FlutterLogo(),
///   onPressed: () {
///     print('Tapped!');
///   },
/// )
/// ```
/// {@endtemplate}
class AppOutlinedButton extends OutlinedButton {
  /// {@macro AppOutlinedButton}
  const AppOutlinedButton({
    Key? key,
    ButtonStyle? style,
    required VoidCallback onPressed,
    required Widget child,
  }) : super(
          key: key,
          style: style,
          onPressed: onPressed,
          child: child,
        );

  /// Create an outlined button from a pair of widgets that serve as the
  /// button's [icon] and [label].
  ///
  /// The icon and label are arranged in a row
  /// (column if you set direction = Axis.vertical)
  /// and padded by 12 logical pixels at the start, and 16 at the end,
  /// with an 8 pixel gap in between.
  ///
  /// The [icon] and [label] arguments must not be null.
  AppOutlinedButton.icon({
    Key? key,
    ButtonStyle? style,
    required VoidCallback onPressed,
    required Widget icon,
    required Widget label,
    Axis? direction,
  }) : super(
          key: key,
          style: style,
          onPressed: onPressed,
          child: _AppButtonWithIconChild(
            icon: icon,
            label: label,
            direction: direction,
          ),
        );
}

/// {@template FSElevatedButton}
/// A App UI Elevated Button.
///
/// Use elevated buttons to add dimension to otherwise mostly flat
/// layouts, e.g.  in long busy lists of content, or in wide
/// spaces. Avoid using elevated buttons on already-elevated content
/// such as dialogs or cards.
///
/// ```dart
/// FSElevatedButton(
///   child: FlutterLogo(),
///   onPressed: () {
///     print('Tapped!');
///   },
/// )
/// ```
/// {@endtemplate}
class AppElevatedButton extends ElevatedButton {
  /// {@macro AppElevatedButton}
  const AppElevatedButton({
    Key? key,
    ButtonStyle? style,
    required VoidCallback onPressed,
    required Widget child,
  }) : super(
          key: key,
          style: style,
          onPressed: onPressed,
          child: child,
        );

  /// Create an elevated button from a pair of widgets that serve as the
  /// button's [icon] and [label].
  ///
  /// The icon and label are arranged in a row
  /// (column if you set direction = Axis.vertical)
  /// and padded by 12 logical pixel at the start, and 16 at the end,
  /// with an 8 pixel gap in between.
  ///
  /// The [icon] and [label] arguments must not be null.
  AppElevatedButton.icon({
    Key? key,
    ButtonStyle? style,
    required VoidCallback onPressed,
    required Widget icon,
    required Widget label,
    Axis? direction,
  }) : super(
          key: key,
          style: style,
          onPressed: onPressed,
          child: _AppButtonWithIconChild(
            icon: icon,
            label: label,
            direction: direction,
          ),
        );
}

class _AppButtonWithIconChild extends StatelessWidget {
  const _AppButtonWithIconChild({
    Key? key,
    this.label,
    this.icon,
    Axis? direction,
  })  : _direction = direction ?? Axis.horizontal,
        super(key: key);

  final Widget? label;
  final Widget? icon;
  final Axis _direction;

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.of(context).textScaleFactor;
    final gap =
        scale <= 1 ? 8.0 : lerpDouble(8, 4, math.min<double>(scale - 1, 1.0));

    return Flex(
      direction: _direction,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[icon!, SizedBox(width: gap), label!],
    );
  }
}
