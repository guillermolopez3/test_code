import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  /// Body of [BasePage]
  final Widget body;
  final Widget? bottomBar;

  const BasePage({
    Key? key,
    required this.body,
    this.bottomBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // Your appbar content here
          ),
      body: body,
    );
  }
}
