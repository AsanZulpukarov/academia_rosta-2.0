part of 'create_hw_bloc.dart';

sealed class CreateHwEvent extends Equatable {
  const CreateHwEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class CreateHWAsTestEvent extends CreateHwEvent {}

final class CreateHWAsTrainerEvent extends CreateHwEvent {}

final class CreateHWDeleteHWStudentEvent extends CreateHwEvent {}
