part of 'delete_hw_bloc.dart';

sealed class DeleteHwState extends Equatable {
  const DeleteHwState();

  @override
  List<Object> get props => [];
}

final class DeleteHwInitialState extends DeleteHwState {
}

final class DeleteHwLoadingState extends DeleteHwState {
}

final class DeleteHwLoadedState extends DeleteHwState {
}

final class DeleteHwErrorState extends DeleteHwState {
  final String message;

  const DeleteHwErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

