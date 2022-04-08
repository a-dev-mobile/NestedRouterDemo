import 'package:flutter/material.dart';

/// {@template FSBottomSheet}
/// A App UI BottomSheet.
///
/// ```dart
/// AppBottomSheet.show(
/// context: context,
/// builder: (context) => AppBottomSheet(
///   child: Text('BottomSheet'),
/// ),
/// );
/// ```
/// {@endtemplate}
class AppBottomSheet extends StatelessWidget {
  /// {@macro AppBottomSheet}

  const AppBottomSheet({Key? key, this.child}) : super(key: key);

  /// A child widget that is to be shown in the bottom sheet
  final Widget? child;

  /// Static method to show open the bottom sheet from the given [BuildContext]
  /// and build it's layout using the given builder.
  static Future<void> show({
    required BuildContext context,
    required Function(BuildContext) builder,
  }) {
    return showModalBottomSheet(
      context: context,
      builder: builder as Widget Function(BuildContext),
    );
  }

  @override
  Widget build(BuildContext context) {
    return child!;
  }
}
