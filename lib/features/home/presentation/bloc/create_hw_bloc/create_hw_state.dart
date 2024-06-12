part of 'create_hw_bloc.dart';

sealed class CreateHwState extends Equatable {
  const CreateHwState();

  @override
  List<Object> get props => [];
}

final class CreateHwInitialState extends CreateHwState {}

final class CreateHWLoadingState extends CreateHwState {}

final class CreateHWLoadedState extends CreateHwState {
  final HWEntity hwEntity;

  const CreateHWLoadedState({required this.hwEntity});

  @override
  // TODO: implement props
  List<Object> get props => [hwEntity];
}

final class CreateHWErrorState extends CreateHwState {
  final String message;

  const CreateHWErrorState({required this.message});
  @override
  // TODO: implement props
  List<Object> get props => [message];
}
