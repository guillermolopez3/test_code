import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

part 'multi_call_event.dart';
part 'multi_call_state.dart';

class MultiCallBloc extends Bloc<MultiCallEvent, MultiCallState> {
  MultiCallBloc() : super(MultiCallInitial()) {
    on<FetchDataRed>(_onFetchDataRed, transformer: concurrent());
    on<FetchDataGreen>(_onFetchDataGreen, transformer: concurrent());
    on<FetchDataBlue>(_onFetchDataBlue, transformer: concurrent());
    //on<FetchAllDataTogether>(_onFetchAllDataTogether);
  }

  Future<void> _onFetchDataRed(FetchDataRed event, Emitter emit) async {
    emit(LoadingRedContainer());
    await Future.delayed(const Duration(seconds: 2));
    emit(LoadedRedContainer());
  }

  Future<void> _onFetchDataGreen(FetchDataGreen event, Emitter emit) async {
    emit(LoadingGreenContainer());
    await Future.delayed(const Duration(seconds: 4));
    emit(LoadedGreenContainer());
  }

  Future<void> _onFetchDataBlue(FetchDataBlue event, Emitter emit) async {
    emit(LoadingBlueContainer());
    await Future.delayed(const Duration(seconds: 6));
    emit(LoadedBlueContainer());
  }

  //llamo a todas desde un mismo evento
  /* Future<void> _onFetchAllDataTogether(
      FetchAllDataTogether event, Emitter emit) async {
    _getRedData(emit);
    _getGreenData(emit);
    _getBlueData(emit);
  }

  Future<void> _getRedData(Emitter emit) async {
    emit(LoadingRedContainer());
    await Future.delayed(const Duration(seconds: 2));
    emit(LoadedRedContainer());
  }

  Future<void> _getGreenData(Emitter emit) async {
    emit(LoadingGreenContainer());
    await Future.delayed(const Duration(seconds: 4));
    emit(LoadedGreenContainer());
  }

  Future<void> _getBlueData(Emitter emit) async {
    emit(LoadingBlueContainer());
    await Future.delayed(const Duration(seconds: 6));
    emit(LoadedBlueContainer());
  } */
}
