import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

/*
 * Widget para aplicar texto enriquecido a traducciones. 
 * Se debe encerrar en un patron espécifico la palabra o frase a la cual se le va a aplicar
 * un estilo diferente o el evento click. Este patron se compone de un sub-índice + [].
 * El subíndice esta compuesto de una letra y un número
 * Ej: Acepto los a1[términos y condiciones] y las a2[políticas de privacidad]
 * 
 * Luego cuando se va a usar este widget se define por el sub-índice que estilo se le va a dar
 * 
 * TulRich(
    text: 'Acepto los a1[términos y condiciones] y las a2[políticas de privacidad]',
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
 * 
 */

class TulRichModel {
  final String patternId;
  final Color? color;
  final Function()? onTap;

  TulRichModel({required this.patternId, this.color, this.onTap});
}

class TulRich extends StatefulWidget {
  final String text;
  final List<TulRichModel> params;
  const TulRich({
    Key? key,
    required this.text,
    required this.params,
  }) : super(key: key);

  @override
  State<TulRich> createState() => _TulRichState();
}

class _TulRichState extends State<TulRich> {
  List<TextSpan> listTxtSpan = [];

  String get _text => widget.text;
  List<TulRichModel> get _params => widget.params;

  @override
  void initState() {
    super.initState();
    _splitText();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '',
        style: DefaultTextStyle.of(context).style,
        children: listTxtSpan,
      ),
    );
  }

  //divide el texto en un array donde el patron buscado es patterId[]
  //del ejemplo quedaría: [Acepto los, a1[términos y condiciones], y las, b2[políticas de privacidad]]
  //luego arma el RichText
  void _splitText() {
    List<TextSpan> lt = [];
    //final split = widget.text.split(RegExp(r'\s*(?=\w\d{.*?})|(?<={.*?})\s*'));
    final split = _text.split(RegExp(r'\s*(?=\w\d\[.*?\])|(?<=\[.*?\])\s*'));

    for (int i = 0; i < split.length; i++) {
      var val =
          _params.firstWhereOrNull((e) => split[i].contains('${e.patternId}['));

      val == null
          ? lt.add(_simpleTextSpan(split[i]))
          : lt.add(_richTextSpan(val, split[i]));
    }

    setState(() {
      listTxtSpan = lt;
    });
  }

  TextSpan _richTextSpan(TulRichModel model, String text) {
    final texto =
        text.replaceFirst('${model.patternId}[', '').replaceFirst(']', '');
    return TextSpan(
      text: '$texto ',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: model.color ?? Colors.blue,
      ),
      recognizer: TapGestureRecognizer()..onTap = model.onTap,
    );
  }

  TextSpan _simpleTextSpan(String text) {
    return TextSpan(text: '$text ');
  }
}
