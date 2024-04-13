import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {
  int? id;
  String? title;
  String? description;
  bool? isRead;
  DateTime? createDate;
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
