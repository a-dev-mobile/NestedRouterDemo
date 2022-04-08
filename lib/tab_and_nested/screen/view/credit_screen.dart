import 'package:flutter/material.dart';

class CreditScreen extends StatelessWidget {
  const CreditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CreditScreen',
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('CreditScreen'),
      ),
    );
  }
}
