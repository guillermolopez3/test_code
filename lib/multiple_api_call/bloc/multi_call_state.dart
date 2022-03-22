part of 'multi_call_bloc.dart';

abstract class MultiCallState extends Equatable {
  const MultiCallState();

  @override
  List<Object> get props => [];
}

class MultiCallInitial extends MultiCallState {}

//container red
class LoadingRedContainer extends MultiCallState {}

class LoadedRedContainer extends MultiCallState {}

//container green
class LoadingGreenContainer extends MultiCallState {}

class LoadedGreenContainer extends MultiCallState {}

//container blue
class LoadingBlueContainer extends MultiCallState {}

class LoadedBlueContainer extends MultiCallState {}
