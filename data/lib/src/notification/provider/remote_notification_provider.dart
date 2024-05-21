part of notification;

abstract class RemoteNotificationProvider {
  Future<void> initialize();

  Future<String> getToken();

  Future<void> deleteToken();

  Future<Notification?> getInitialNotification();

  Stream<String> get observeTokenUpdates;

  Stream<Notification> get observeBackgroundNotifications;

  Stream<ForegroundNotification> get observeForegroundNotifications;
}
