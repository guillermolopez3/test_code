part of 'form_test_bloc.dart';

abstract class FormTestState extends Equatable {
  final Model model;
  const FormTestState(this.model);

  @override
  List<Object> get props => [model];
}

class FormTestInitial extends FormTestState {
  const FormTestInitial(Model model) : super(model);
}

class UpdatePageState extends FormTestState {
  const UpdatePageState(Model model) : super(model);
}

class Model extends Equatable {
  final Email email;
  final Password password;
  final Nombre nombre;

  const Model({
    this.email = const Email(),
    this.password = const Password(),
    this.nombre = const Nombre(),
  });

  bool get isValid => email.isValid && password.isValid & nombre.isValid;

  Model copyWith({Email? email, Password? password, Nombre? nombre}) {
    return Model(
      email: email ?? this.email,
      password: password ?? this.password,
      nombre: nombre ?? this.nombre,
    );
  }

  @override
  List<Object?> get props => [email, password, nombre];
}
