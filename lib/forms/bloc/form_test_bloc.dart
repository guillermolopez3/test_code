import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_code/forms/validators/email.dart';
import 'package:test_code/forms/validators/nombre.dart';
import 'package:test_code/forms/validators/password.dart';

part 'form_test_event.dart';
part 'form_test_state.dart';

class FormTestBloc extends Bloc<FormTestEvent, FormTestState> {
  FormTestBloc() : super(const FormTestInitial(Model())) {
    on<EmailChangeEvent>(_onEmailChangeEvent);
    on<PassChangeEvent>(_onPassChangeEvent);
    on<NombreChangeEvent>(_onNombreChangeEvent);
  }

  void _onEmailChangeEvent(EmailChangeEvent event, Emitter emit) {
    final email = state.model.email.copyWith(value: event.email);
    emit(UpdatePageState(state.model.copyWith(email: email.validate())));
  }

  void _onPassChangeEvent(PassChangeEvent event, Emitter emit) {
    final pass = state.model.password.copyWith(value: event.pass);
    emit(UpdatePageState(state.model.copyWith(password: pass.validate())));
  }

  void _onNombreChangeEvent(NombreChangeEvent event, Emitter emit) {
    final nombre = state.model.nombre.copyWith(value: event.nombre);
    emit(UpdatePageState(state.model.copyWith(nombre: nombre.validate())));
  }
}
