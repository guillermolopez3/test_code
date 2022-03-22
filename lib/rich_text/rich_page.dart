import 'package:flutter/material.dart';
import 'package:test_code/rich_text/rich_page2.dart';
import 'package:test_code/rich_text/tul_rich.dart';

const espanolText =
    'Acepto los a1[términos y condiciones] y las a2[políticas de privacidad]';
const inglesText = 'agree a2[privacy policy]';

class RichPage extends StatelessWidget {
  const RichPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Center(
        child: TulRich(
          text: espanolText,
          params: [
            TulRichModel(
              patternId: 'a1',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RichPage2(),
                  ),
                );
              },
            ),
            TulRichModel(patternId: 'a2', color: Colors.green),
          ],
        ),
      ),
    );
  }
}
