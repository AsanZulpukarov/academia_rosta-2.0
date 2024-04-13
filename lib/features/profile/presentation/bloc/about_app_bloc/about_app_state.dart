part of 'about_app_bloc.dart';

sealed class AboutAppState extends Equatable {
  const AboutAppState();

  @override
  List<Object> get props => [];
}

final class AboutAppInitialState extends AboutAppState {}

final class AboutAppLoadingState extends AboutAppState {}

final class AboutAppLoadedState extends AboutAppState {}

final class AboutAppErrorState extends AboutAppState {}
