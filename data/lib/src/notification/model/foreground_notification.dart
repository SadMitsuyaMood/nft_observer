part of notification;

class ForegroundNotification {
  final int hashcode;
  final String? body;
  final String? title;
  final String? payload;

  ForegroundNotification({
    required this.hashcode,
    required this.body,
    required this.title,
    required this.payload,
  });
}
