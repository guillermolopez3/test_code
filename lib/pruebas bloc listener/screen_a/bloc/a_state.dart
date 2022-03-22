part of 'a_bloc.dart';

abstract class AState extends Equatable {
  const AState();

  @override
  List<Object> get props => [];
}

class AInitial extends AState {}

class ALoadingData extends AState {}

class ALoadedData extends AState {}

class AErrorState extends AState {}
