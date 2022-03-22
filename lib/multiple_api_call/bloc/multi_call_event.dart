part of 'multi_call_bloc.dart';

abstract class MultiCallEvent extends Equatable {
  const MultiCallEvent();

  @override
  List<Object> get props => [];
}

class FetchAllDataTogether extends MultiCallEvent {}

class FetchDataRed extends MultiCallEvent {}

class FetchDataGreen extends MultiCallEvent {}

class FetchDataBlue extends MultiCallEvent {}
