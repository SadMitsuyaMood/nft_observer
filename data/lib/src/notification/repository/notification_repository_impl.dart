part of notification;

class NotificationRepositoryImpl implements domain.NotificationRepository {
  final LocalNotificationProvider _localNotificationProvider;
  final RemoteNotificationProvider _remoteNotificationProvider;

  final StreamController<domain.Notification> _receivedNotificationsController =
      StreamController<domain.Notification>.broadcast();

  NotificationRepositoryImpl({
    required LocalNotificationProvider localNotificationProvider,
    required RemoteNotificationProvider remoteNotificationProvider,
  })  : _localNotificationProvider = localNotificationProvider,
        _remoteNotificationProvider = remoteNotificationProvider {
    _initialize();
  }

  void _initialize() {
    if (Platform.isAndroid) {
      _remoteNotificationProvider.observeForegroundNotifications.listen(_localNotificationProvider.show);
      _localNotificationProvider.observeReceivedNotifications.listen(
        (Notification notification) => _receivedNotificationsController.add(notification.toDomain),
      );
    }

    _remoteNotificationProvider.observeBackgroundNotifications.listen(
      (Notification notification) => _receivedNotificationsController.add(notification.toDomain),
    );
  }

  @override
  Future<domain.Notification?> getInitial() async {
    final Notification? initialNotification = await _remoteNotificationProvider.getInitialNotification();
    return initialNotification?.toDomain;
  }

  @override
  Stream<domain.Notification> get observe => _receivedNotificationsController.stream;
}
