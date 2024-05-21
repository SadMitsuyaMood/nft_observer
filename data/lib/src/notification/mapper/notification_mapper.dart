part of notification;

class NotificationMapper {
  static Notification fromMap(Map<String, dynamic> map) {
    return const Notification();
  }
}

extension NotificationToDomainExtension on Notification {
  domain.Notification get toDomain => const domain.Notification();
}
