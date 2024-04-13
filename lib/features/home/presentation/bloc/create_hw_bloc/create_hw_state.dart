part of 'create_hw_bloc.dart';

sealed class CreateHwState extends Equatable {
  const CreateHwState();
  @override
  List<Object> get props => [];
}

final class CreateHwInitialState extends CreateHwState {}

final class CreateHWLoadingState extends CreateHwState {}

final class CreateHWLoadedState extends CreateHwState {}

final class CreateHWErrorState extends CreateHwState {}
