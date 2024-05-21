part of notification;

class FirebaseNotificationProvider implements RemoteNotificationProvider {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance..setAutoInitEnabled(true);

  final StreamController<Notification> _backgroundNotificationsController = StreamController<Notification>.broadcast();
  final StreamController<ForegroundNotification> _foregroundNotificationsController =
      StreamController<ForegroundNotification>.broadcast();
  final StreamController<String> _tokenUpdatesController = StreamController<String>.broadcast();

  @override
  Future<void> initialize() async {
    await _messaging.requestPermission();
    await _messaging.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification == null) return;

      _foregroundNotificationsController.add(
        ForegroundNotificationMapper.fromRemote(
          remoteNotification: message.notification!,
          payload: jsonEncode(message.data),
        ),
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _backgroundNotificationsController.add(NotificationMapper.fromMap(message.data));
    });

    _messaging.onTokenRefresh.listen(_tokenUpdatesController.add);
  }

  @override
  Future<String> getToken() async {
    try {
      return await _messaging.getToken() ?? '';
    } catch (_) {
      return '';
    }
  }

  @override
  Future<void> deleteToken() async {
    try {
      await _messaging.deleteToken();
    } catch (_) {
      return;
    }
  }

  @override
  Future<Notification?> getInitialNotification() async {
    final RemoteMessage? initialMessage = await _messaging.getInitialMessage();

    if (initialMessage == null) return null;

    return NotificationMapper.fromMap(initialMessage.data);
  }

  @override
  Stream<String> get observeTokenUpdates => _tokenUpdatesController.stream;

  @override
  Stream<Notification> get observeBackgroundNotifications => _backgroundNotificationsController.stream;

  @override
  Stream<ForegroundNotification> get observeForegroundNotifications => _foregroundNotificationsController.stream;
}
