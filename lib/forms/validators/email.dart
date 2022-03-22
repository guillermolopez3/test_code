import 'package:flutter/src/services/text_formatter.dart';
import 'package:flutter/src/services/text_input.dart';
import 'package:test_code/forms/validators/validator.dart';
import '../extensions/string_stension.dart';

class Email extends Validator<Email> {
  final String value;

  const Email({String? value, String? validationMessage})
      : value = value ?? '',
        super(validationMessage);

  @override
  Email validate() {
    if (value.isEmpty) return copyWith(validationMessage: 'Campo vacio');
    if (!value.isValidEmail) {
      return copyWith(validationMessage: 'Formato incorrecto');
    }
    return this;
  }

  @override
  Email copyWith({String? value, String? validationMessage}) => Email(
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
    return null;
  }
}
