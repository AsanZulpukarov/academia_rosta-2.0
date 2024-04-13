part of 'trainer_bloc.dart';

sealed class TrainerEvent extends Equatable {
  const TrainerEvent();

  @override
  List<Object> get props => [];
}

class TrainerSelectThemeEvent extends TrainerEvent {
  String theme;

  TrainerSelectThemeEvent(this.theme);
  @override
  // TODO: implement props
  List<Object> get props => [theme];
}
