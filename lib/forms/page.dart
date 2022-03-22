import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_code/forms/bloc/form_test_bloc.dart';

class PageForm extends StatelessWidget {
  const PageForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forms')),
      body: BlocProvider<FormTestBloc>(
        create: (context) => FormTestBloc(),
        child: BlocBuilder<FormTestBloc, FormTestState>(
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Nombre',
                    errorText: state.model.nombre.validationMessage,
                  ),
                  inputFormatters: state.model.nombre.inputFormatters(),
                  onChanged: (value) => context
                      .read<FormTestBloc>()
                      .add(NombreChangeEvent(value)),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    errorText: state.model.email.validationMessage,
                  ),
                  keyboardType: state.model.email.keyboardType(),
                  inputFormatters: state.model.email.inputFormatters(),
                  onChanged: (value) =>
                      context.read<FormTestBloc>().add(EmailChangeEvent(value)),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    errorText: state.model.password.validationMessage,
                  ),
                  onChanged: (value) =>
                      context.read<FormTestBloc>().add(PassChangeEvent(value)),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: state.model.isValid ? () {} : null,
                  child: const Text('Enviar'),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
