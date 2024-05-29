part of 'hw_bloc.dart';

sealed class HWState extends Equatable {
  const HWState();

  @override
  List<Object> get props => [];
}

final class HWInitialState extends HWState {}

final class HWLoadingState extends HWState {}

final class HWLoadedState extends HWState {
  final List<HWEntity> hw;

  const HWLoadedState({required this.hw});
  @override
  // TODO: implement props
  List<Object> get props => [hw];
}

final class HWErrorState extends HWState {
  final String message;

  const HWErrorState({required this.message});
  @override
  // TODO: implement props
  List<Object> get props => [message];
}
