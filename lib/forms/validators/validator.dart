import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class Validator<T extends Validator<T>> extends Equatable {
  final String? validationMessage;
  const Validator(this.validationMessage);

  bool get isValid => validate().validationMessage == null;

  T validate();

  TextInputType? keyboardType();

  List<TextInputFormatter>? inputFormatters();

  T copyWith({String? validationMessage});
}
