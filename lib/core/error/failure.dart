import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  final String message;

  ServerFailure({required this.message});
}

class CacheFailure extends Failure {}

class InternetFailure extends Failure {}
