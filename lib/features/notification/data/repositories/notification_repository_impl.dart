import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/features/notification/domain/entities/notifiaction_entity.dart';
import 'package:academia_rosta_diplom/features/notification/domain/repositories/notification_repository.dart';
import 'package:dartz/dartz.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  NotificationRepositoryImpl();

  @override
  Future<Either<Failure, List<NotificationEntity>>> getAllNotifications() {
    // TODO: implement getAllNotifications
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> postReadAllNotification(
      List<NotificationEntity> notificationList) {
    // TODO: implement postReadAllNotification
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> postReadNotificationById(
      NotificationEntity notification) {
    // TODO: implement postReadNotificationById
    throw UnimplementedError();
  }
}
