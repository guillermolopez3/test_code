import 'package:flutter/material.dart';
import 'package:test_code/custom_paint/page.dart';
import 'package:test_code/forms/page.dart';
import 'package:test_code/multiple_api_call/m_api_call_screen.dart';
import 'package:test_code/rich_text/rich_page.dart';
import 'package:test_code/tul_dropdown/dropdown.dart';
import 'package:test_code/pruebas%20bloc%20listener/screen_a/screen_a.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pruebas de cosas'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TulDD(),
                    ),
                  );
                },
                child: const Text('TulDropDown'),
              ),
              /* const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ScreenAPage(),
                    ),
                  );
                },
                child: const Text('Bloc que usa otro bloc'),
              ), */
              /* const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const MultiCallPage(),
                    ),
                  );
                },
                child: const Text('Multiple api call'),
              ), */
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RichPage(),
                    ),
                  );
                },
                child: const Text('TulRich'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PageGreen(),
                    ),
                  );
                },
                child: const Text('CustomPainter'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PageForm(),
                    ),
                  );
                },
                child: const Text('Forms con bloc'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
