import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/features/notification/domain/entities/notifiaction_entity.dart';
import 'package:dartz/dartz.dart';

abstract class NotificationRepository {
  Future<Either<Failure, List<NotificationEntity>>> getAllNotifications();

  Future<Either<Failure, void>> postReadNotificationById(
      NotificationEntity notification);

  Future<Either<Failure, void>> postReadAllNotification(
      List<NotificationEntity> notificationList);
}
