import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SettingsScreen',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Settings screen'),
      ),
    );
  }
}
