part of notification;

class GetInitialNotificationUseCase extends FutureUseCase<Notification?, NoPayload> {
  final NotificationRepository _notificationRepository;

  GetInitialNotificationUseCase({
    required NotificationRepository notificationRepository,
  }) : _notificationRepository = notificationRepository;

  @override
  Future<Notification?> execute(NoPayload payload) {
    return _notificationRepository.getInitial();
  }
}
