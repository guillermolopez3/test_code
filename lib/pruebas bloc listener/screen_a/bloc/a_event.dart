part of 'a_bloc.dart';

abstract class AEvent extends Equatable {
  const AEvent();

  @override
  List<Object> get props => [];
}

class FetchDataA extends AEvent {}
