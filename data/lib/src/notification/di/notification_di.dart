part of notification;

abstract class NotificationDI {
  static Future<void> registerDependencies() async {
    final LocalNotificationProviderImpl localNotificationProvider = LocalNotificationProviderImpl();
    await localNotificationProvider.initialize();
    serviceLocator.registerSingleton<LocalNotificationProvider>(localNotificationProvider);

    final FirebaseNotificationProvider firebaseNotificationProvider = FirebaseNotificationProvider();
    await firebaseNotificationProvider.initialize();
    serviceLocator.registerSingleton<RemoteNotificationProvider>(firebaseNotificationProvider);

    serviceLocator.registerSingleton<domain.NotificationRepository>(
      NotificationRepositoryImpl(
        localNotificationProvider: serviceLocator<LocalNotificationProvider>(),
        remoteNotificationProvider: serviceLocator<RemoteNotificationProvider>(),
      ),
    );
  }
}
