import 'package:academia_rosta_diplom/features/notification/domain/entities/notifiaction_entity.dart';

abstract class NotificationRemoteDataSource {
  Future<List<NotificationEntity>> getAllNotifications();

  Future<void> postReadNotificationById(NotificationEntity notification);

  Future<void> postReadAllNotification(
      List<NotificationEntity> notificationList);
}
