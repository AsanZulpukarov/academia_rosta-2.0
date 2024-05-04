import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final bool? isRead;
  final DateTime? createDate;

  const NotificationEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.isRead,
      required this.createDate});
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
