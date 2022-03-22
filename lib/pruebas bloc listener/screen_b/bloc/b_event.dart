part of 'b_bloc.dart';

abstract class BEvent extends Equatable {
  const BEvent();

  @override
  List<Object> get props => [];
}

class PressedButton extends BEvent {}

class BlocAReady extends BEvent {}
