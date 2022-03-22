import 'package:flutter/material.dart';

class RichPage2 extends StatelessWidget {
  const RichPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: const Center(
        child: Text('Página 2'),
      ),
    );
  }
}
