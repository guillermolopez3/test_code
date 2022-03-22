part of 'b_bloc.dart';

abstract class BState extends Equatable {
  const BState();

  @override
  List<Object> get props => [];
}

class BInitial extends BState {}

class BLoadingdata extends BState {}

class BLoadedData extends BState {}
