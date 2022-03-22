import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_code/multiple_api_call/bloc/multi_call_bloc.dart';

class MultiCallPage extends StatelessWidget {
  const MultiCallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MultiCallBloc>(
      create: (_) => MultiCallBloc() //..add(FetchAllDataTogether()),
        ..add(FetchDataRed())
        ..add(FetchDataGreen())
        ..add(FetchDataBlue()),
      child: const MultiCallView(),
    );
  }
}

class MultiCallView extends StatelessWidget {
  const MultiCallView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple llamadas a apis'),
      ),
      body: Column(
        children: const [
          Flexible(
            flex: 1,
            child: _ContainerRed(),
          ),
          Flexible(
            flex: 1,
            child: _ContainerGreen(),
          ),
          Flexible(
            flex: 1,
            child: _ContainerBlue(),
          )
        ],
      ),
    );
  }
}

class _ContainerRed extends StatelessWidget {
  const _ContainerRed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MultiCallBloc, MultiCallState>(
      builder: (ctx, state) {
        if (state is LoadingRedContainer) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is LoadedRedContainer) {
          return Container(
            color: Colors.red,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _ContainerGreen extends StatelessWidget {
  const _ContainerGreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MultiCallBloc, MultiCallState>(
      builder: (ctx, state) {
        if (state is LoadingGreenContainer) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is LoadedGreenContainer) {
          return Container(
            color: Colors.green,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _ContainerBlue extends StatelessWidget {
  const _ContainerBlue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MultiCallBloc, MultiCallState>(
      builder: (ctx, state) {
        if (state is LoadingBlueContainer) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is LoadedBlueContainer) {
          return Container(
            color: Colors.blue,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
