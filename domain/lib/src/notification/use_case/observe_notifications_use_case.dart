part of notification;

class ObserveNotificationsUseCase extends StreamUseCase<Notification, NoPayload> {
  final NotificationRepository _notificationRepository;

  ObserveNotificationsUseCase({
    required NotificationRepository notificationRepository,
  }) : _notificationRepository = notificationRepository;

  @override
  Stream<Notification> execute(NoPayload payload) {
    return _notificationRepository.observe;
  }
}
