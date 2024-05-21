part of notification;

class ForegroundNotificationMapper {
  static ForegroundNotification fromRemote({
    required RemoteNotification remoteNotification,
    required String? payload,
  }) {
    return ForegroundNotification(
      hashcode: remoteNotification.hashCode,
      body: remoteNotification.body,
      title: remoteNotification.title,
      payload: payload,
    );
  }
}
