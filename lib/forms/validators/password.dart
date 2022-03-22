import 'package:flutter/src/services/text_formatter.dart';
import 'package:flutter/src/services/text_input.dart';
import 'package:test_code/forms/validators/validator.dart';
import '../extensions/string_stension.dart';

class Password extends Validator<Password> {
  final String value;

  const Password({String? value, String? validationMessage})
      : value = value ?? '',
        super(validationMessage);

  @override
  Password validate() {
    if (value.isEmpty) return copyWith(validationMessage: 'Campo vacio');
    if (!value.isValidPasswordFormat) {
      return copyWith(validationMessage: 'Formato incorrecto');
    }
    return this;
  }

  @override
  Password copyWith({String? value, String? validationMessage}) => Password(
        value: value ?? this.value,
        validationMessage: validationMessage ?? validationMessage,
      );
  @override
  List<Object?> get props => [value, validationMessage];

  @override
  TextInputType? keyboardType() {
    return null;
  }

  @override
  List<TextInputFormatter>? inputFormatters() {
    return null;
  }
}
