import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_code/pruebas%20bloc%20listener/screen_a/bloc/a_bloc.dart';

part 'b_event.dart';
part 'b_state.dart';

class BBloc extends Bloc<BEvent, BState> {
  final ABloc aBloc;
  BBloc({required this.aBloc}) : super(BInitial()) {
    aBloc.stream.listen(
      (state) {
        if (state is ALoadedData) {
          print('data cargada');
          add(BlocAReady());
        }
      },
    );

    on<PressedButton>(_onPressedButton);
    on<BlocAReady>(_onBlocAReady);
  }

  Future<void> _onPressedButton(PressedButton event, Emitter emit) async {
    emit(BLoadingdata());
    aBloc.add(FetchDataA());
  }

  Future<void> _onBlocAReady(BlocAReady event, Emitter emit) async {
    await Future.delayed(const Duration(seconds: 2));
    emit(BLoadedData());
  }
}
