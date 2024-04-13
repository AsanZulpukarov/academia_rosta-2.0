part of 'about_app_bloc.dart';

sealed class AboutAppEvent extends Equatable {
  const AboutAppEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class AboutAppEmptyEvent extends AboutAppEvent{}
