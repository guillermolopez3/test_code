import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_code/pruebas%20bloc%20listener/screen_a/bloc/a_bloc.dart';
import 'package:test_code/pruebas%20bloc%20listener/screen_b/bloc/b_bloc.dart';

class ScreenBPage extends StatelessWidget {
  final ABloc aBloc;
  const ScreenBPage({Key? key, required this.aBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BBloc>(
      create: (_) => BBloc(aBloc: aBloc),
      child: const ScreenBView(),
    );
  }
}

class ScreenBView extends StatelessWidget {
  const ScreenBView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final aBloc = context.read<BBloc>().aBloc;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page B'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<BBloc>().add(PressedButton());
              },
              child: const Text('Presionar'),
            ),
            const SizedBox(height: 15),
            BlocBuilder<BBloc, BState>(
              builder: (ctx, state) {
                if (state is BLoadingdata) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is BLoadedData) {
                  return const Center(
                    child: Text('Bloc a y b listos'),
                  );
                }
                return const SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }
}
