import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_code/forms/validators/validator.dart';
import '../extensions/string_stension.dart';

class Nombre extends Validator<Nombre> {
  final String value;

  const Nombre({String? value, String? validationMessage})
      : value = value ?? '',
        super(validationMessage);

  @override
  Nombre validate() {
    if (value.isEmpty) return copyWith(validationMessage: 'Campo vacio');

    return this;
  }

  @override
  Nombre copyWith({String? value, String? validationMessage}) => Nombre(
        value: value ?? this.value,
        validationMessage: validationMessage ?? validationMessage,
      );
  @override
  List<Object?> get props => [value, validationMessage];

  @override
  TextInputType? keyboardType() {
    return TextInputType.emailAddress;
  }

  @override
  List<TextInputFormatter>? inputFormatters() {
    return [
      FilteringTextInputFormatter.allow(RegExp('[A-Za-z.]')),
    ];
  }
}
