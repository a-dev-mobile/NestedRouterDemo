import 'package:flutter/material.dart';

/// {@template fs_chip}
/// A App styled `Chip`.
///
/// The provided [label] cannot be `null` and will be shown in the center of the
/// chip. An optional `icon` can be provided and will be shown to the left of
/// the [label].
///
/// In its current implementation, the resulting component is no different from
/// the `package:material` [Chip].
/// {@endtemplate}
class AppChip extends Chip {
  /// {@macro App_chip}
  const AppChip({
    Key? key,
    Widget? icon,
    required Widget label,
  }) : super(
          key: key,
          avatar: icon,
          label: label,
        );
}
