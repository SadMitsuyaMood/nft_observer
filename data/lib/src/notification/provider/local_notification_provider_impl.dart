part of notification;

class LocalNotificationProviderImpl implements LocalNotificationProvider {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final StreamController<Notification> _receivedNotificationsController = StreamController<Notification>.broadcast();

  @override
  Future<void> initialize() async {
    try {
      if (Platform.isAndroid) {
        final AndroidFlutterLocalNotificationsPlugin? androidFlutterLocalNotificationsPlugin =
            _flutterLocalNotificationsPlugin
                .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

        final int androidSdkVersion = await PlatformManager.getAndroidSdkVersion();
        if (androidSdkVersion >= 33) {
          await androidFlutterLocalNotificationsPlugin?.requestNotificationsPermission();
        }
        await androidFlutterLocalNotificationsPlugin?.createNotificationChannel(_androidChannel);
      } else if (Platform.isIOS) {
        await _flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
            ?.requestPermissions(alert: true, badge: true, sound: true);
      }
    } catch (_) {}

    await _flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) {
        if (notificationResponse.payload == null) return;

        _receivedNotificationsController.add(
          NotificationMapper.fromMap(jsonDecode(notificationResponse.payload!) as Map<String, dynamic>),
        );
      },
    );
  }

  @override
  Future<void> cancelAll() => _flutterLocalNotificationsPlugin.cancelAll();

  @override
  void show(ForegroundNotification foregroundNotification) {
    _flutterLocalNotificationsPlugin.show(
      foregroundNotification.hashcode,
      foregroundNotification.title,
      foregroundNotification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          _androidChannel.id,
          _androidChannel.name,
          channelDescription: _androidChannel.description,
          importance: _androidChannel.importance,
          playSound: _androidChannel.playSound,
          //TODO update the icon and color
          icon: '@mipmap/ic_launcher',
        ),
      ),
      payload: foregroundNotification.payload,
    );
  }

  @override
  Stream<Notification> get observeReceivedNotifications => _receivedNotificationsController.stream;

  final AndroidNotificationChannel _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
  );
}
