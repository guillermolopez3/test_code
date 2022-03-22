part of 'form_test_bloc.dart';

abstract class FormTestEvent extends Equatable {
  const FormTestEvent();

  @override
  List<Object> get props => [];
}

class EmailChangeEvent extends FormTestEvent {
  final String email;
  const EmailChangeEvent(this.email);
  @override
  List<Object> get props => [email];
}

class PassChangeEvent extends FormTestEvent {
  final String pass;
  const PassChangeEvent(this.pass);
  @override
  List<Object> get props => [pass];
}

class NombreChangeEvent extends FormTestEvent {
  final String nombre;
  const NombreChangeEvent(this.nombre);
  @override
  List<Object> get props => [nombre];
}
