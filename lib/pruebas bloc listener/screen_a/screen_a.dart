import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_code/pruebas%20bloc%20listener/screen_a/bloc/a_bloc.dart';
import 'package:test_code/pruebas%20bloc%20listener/screen_b/screen_b.dart';

class ScreenAPage extends StatelessWidget {
  const ScreenAPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ABloc()..add(FetchDataA()),
      child: const ScreenAView(),
    );
  }
}

class ScreenAView extends StatelessWidget {
  const ScreenAView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen A'),
      ),
      body: BlocBuilder<ABloc, AState>(
        builder: (ctx, state) {
          if (state is ALoadingData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ALoadedData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Página cargada'),
                  const SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: () {
                        final bloc = context.read<ABloc>();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ScreenBPage(aBloc: bloc),
                          ),
                        );
                      },
                      child: const Text('ir a pág B')),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
