import 'package:flutter/material.dart';
import 'package:test_code/custom_paint/clip_path.dart';
import 'package:test_code/custom_paint/green.dart';

class PageGreen extends StatelessWidget {
  const PageGreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom painter'),
      ),
      body: ListView(
        children: const [
          Text('Pruebas'),
          SizedBox(height: 15),
          GreenCustomClipper(),
        ],
      ),
    );
  }
}

class GreenCustomClipper extends StatelessWidget {
  const GreenCustomClipper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: GreenClipPath(),
      child: Container(
        color: Colors.yellow,
        child: Column(
          children: const [
            Text('Texto de pruebas'),
            SizedBox(
              height: 15,
            ),
            Text('Texto de pruebas'),
            SizedBox(
              height: 15,
            ),
            Text('Texto de pruebas'),
            SizedBox(
              height: 15,
            ),
            Text('Texto de pruebas'),
            SizedBox(
              height: 15,
            ),
            Text('Texto de pruebas'),
            SizedBox(
              height: 15,
            ),
            Text('Texto de pruebas'),
            SizedBox(
              height: 15,
            ),
            Text('Texto de pruebas'),
            SizedBox(
              height: 15,
            ),
            Text('Texto de pruebas'),
            SizedBox(
              height: 15,
            ),
            Text('Texto de pruebas'),
            SizedBox(
              height: 15,
            ),
            Text('Texto de pruebas'),
          ],
        ),
      ),
    );
  }
}

class GreenZone extends StatelessWidget {
  const GreenZone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      width: width,
      child: CustomPaint(
        painter: TiketWidget(),
        child: ListView(
          children: const [
            Text('Texto de pruebas'),
            SizedBox(
              height: 15,
            ),
            Text('Texto de pruebas'),
            SizedBox(
              height: 15,
            ),
            Text('Texto de pruebas'),
            SizedBox(
              height: 15,
            ),
            Text('Texto de pruebas'),
            SizedBox(
              height: 15,
            ),
            Text('Texto de pruebas'),
            SizedBox(
              height: 15,
            ),
            Text('Texto de pruebas'),
            SizedBox(
              height: 15,
            ),
            Text('Texto de pruebas'),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
