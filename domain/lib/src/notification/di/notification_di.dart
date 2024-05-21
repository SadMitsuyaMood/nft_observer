part of notification;

abstract class NotificationDI {
  static void registerDependencies() {
    serviceLocator.registerLazySingleton<GetInitialNotificationUseCase>(
      () => GetInitialNotificationUseCase(notificationRepository: serviceLocator<NotificationRepository>()),
    );

    serviceLocator.registerLazySingleton<ObserveNotificationsUseCase>(
      () => ObserveNotificationsUseCase(notificationRepository: serviceLocator<NotificationRepository>()),
    );
  }
}
