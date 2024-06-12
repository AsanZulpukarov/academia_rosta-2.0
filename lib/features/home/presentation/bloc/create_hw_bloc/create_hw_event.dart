part of 'create_hw_bloc.dart';

sealed class CreateHwEvent extends Equatable {
  const CreateHwEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class CreateHWSaveEvent extends CreateHwEvent {
  final CreateHWEntity createHWEntity;

  const CreateHWSaveEvent({required this.createHWEntity});
  @override
  // TODO: implement props
  List<Object?> get props => [createHWEntity];
}
