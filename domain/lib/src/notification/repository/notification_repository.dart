part of notification;

abstract class NotificationRepository {
  Future<Notification?> getInitial();

  Stream<Notification> get observe;
}
