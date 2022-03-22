import 'package:flutter/material.dart';

class TulDD extends StatefulWidget {
  TulDD({Key? key}) : super(key: key);

  @override
  State<TulDD> createState() => _HomeState();
}

class _HomeState extends State<TulDD> {
  final _formKey = GlobalKey<FormState>();
  String valor = '';

  final list = ['Guille', 'Yael', 'Nati'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TulDropDown<String>(
                  title: 'Test',
                  items: list,
                  hintText: 'Seleccione 1',
                  validation: (valor) => valor == null ? " Elegir uno" : null,
                  onChanged: (value) {
                    setState(() {
                      valor = valor;
                    });
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        print('fallo validacion');
                        return;
                      }
                    },
                    child: const Text('Press'))
              ],
            )),
      ),
    );
  }
}

class TulDropDown<T> extends StatefulWidget {
  final String? title;
  final T? value;
  final List<T> items;
  final void Function(T?)? onChanged;
  final String? nameToShow;
  final String? Function(T?)? validation;
  final String? hintText;

  const TulDropDown({
    Key? key,
    this.title,
    this.value,
    this.items = const [],
    this.onChanged,
    this.nameToShow,
    this.validation,
    this.hintText,
  }) : super(key: key);

  @override
  State<TulDropDown<T>> createState() => _TulDropDownState<T>();
}

class _TulDropDownState<T> extends State<TulDropDown<T>> {
  T? selected;
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.only(
              bottom: 12,
              left: 14,
            ),
            child: Text(
              widget.title!,
            ),
          ),
        DropdownButtonFormField<T>(
          value: widget.value,
          icon: const Icon(Icons.keyboard_arrow_down),
          validator: widget.validation,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
                color: widget.onChanged == null
                    ? Color(0xFFEFEFEF)
                    : Color(0xFFAAAAAA)),
            fillColor:
                widget.onChanged == null ? Color(0xFFEFEFEF) : Colors.white,
            filled: true,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(1),
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            isDense: false,
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(
                color: Color(0xffefefef),
                width: 1.0,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(
                color: Color(0xffefefef),
                width: 1.0,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(
                color: Color(0xffe54949),
                width: 1.0,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(
                color: Color(0xffe54949),
                width: 1.0,
              ),
            ),
          ),
          style: Theme.of(context).textTheme.subtitle1,
          items: List.generate(widget.items.length, (i) {
            return widget.items[i] == selected
                ? DropdownMenuItem<T>(
                    value: widget.items[i],
                    child: Container(
                      color: Colors.red,
                      constraints: BoxConstraints(maxWidth: 2000),
                      width: double.infinity,
                      child: Text(
                        _stringText(widget.items[i]),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                : DropdownMenuItem<T>(
                    value: widget.items[i],
                    child: Text(
                      _stringText(widget.items[i]),
                      style: const TextStyle(),
                    ),
                  );
          }),
          onChanged: (value) {
            setState(() {
              selected = value;
              //widget!.onChanged(value);
            });
          },
        ),
      ],
    );
  }

  String _stringText(dynamic item) {
    if (widget.nameToShow == null) return item;

    try {
      final map = item.toJson();
      return map[widget.nameToShow];
    } catch (e) {
      return '';
    }
  }
}
