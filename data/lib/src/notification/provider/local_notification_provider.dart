part of notification;

abstract class LocalNotificationProvider {
  Future<void> initialize();

  Future<void> cancelAll();

  void show(ForegroundNotification foregroundNotification);

  Stream<Notification> get observeReceivedNotifications;
}
