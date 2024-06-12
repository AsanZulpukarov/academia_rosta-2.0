part of 'delete_hw_bloc.dart';

sealed class DeleteHwEvent extends Equatable {
  const DeleteHwEvent();
}
final class HWDeleteEvent extends DeleteHwEvent {
  final int idHW;

  const HWDeleteEvent({required this.idHW});

  @override
  // TODO: implement props
  List<Object?> get props => [idHW];
}