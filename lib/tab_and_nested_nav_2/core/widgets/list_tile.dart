import 'package:flutter/material.dart';

/// {@template AppListTile}
/// A App UI List tile.
/// ```dart
/// AppListTile(
///   title: Text('Create new League'),
///   leading: Icon(Icons.add),
///   trailing: Icon(Icons.add)
///   onTap:(){}
/// ),
/// ```
///
/// {@endtemplate}
class AppListTile extends ListTile {
  /// {@macro AppListTile}.

  const AppListTile({
    Key? key,
    Widget? title,
    Widget? leading,
    Function? onTap,
    Widget? trailing,
    Widget? subtitle,
    bool? dense,
    EdgeInsets? contentPadding,
  }) : super(
          title: title,
          leading: leading,
          onTap: onTap as void Function()?,
          trailing: trailing,
          subtitle: subtitle,
          dense: dense,
          key: key,
          contentPadding: contentPadding,
        );
}
