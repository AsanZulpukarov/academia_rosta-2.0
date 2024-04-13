import 'package:academia_rosta_diplom/features/notification/data/datasources/notification_remote_data_source.dart';
import 'package:academia_rosta_diplom/features/notification/domain/entities/notifiaction_entity.dart';

class NotificationRemoteDataSourceImpl extends NotificationRemoteDataSource {
  NotificationRemoteDataSourceImpl();

  @override
  Future<List<NotificationEntity>> getAllNotifications() {
    // TODO: implement getAllNotifications
    throw UnimplementedError();
  }

  @override
  Future<void> postReadAllNotification(
      List<NotificationEntity> notificationList) {
    // TODO: implement postReadAllNotification
    throw UnimplementedError();
  }

  @override
  Future<void> postReadNotificationById(NotificationEntity notification) {
    // TODO: implement postReadNotificationById
    throw UnimplementedError();
  }
}
