part of 'hw_bloc.dart';

sealed class HWState extends Equatable {
  const HWState();

  @override
  List<Object> get props => [];
}

final class HWInitialState extends HWState {}

final class HWLoadingState extends HWState {}

final class HWLoadedState extends HWState {}

final class HWErrorState extends HWState {}
