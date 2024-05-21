import 'package:data/src/notification/notification.dart';

abstract class DataDI {
  static Future<void> registerDependencies() async {
    await NotificationDI.registerDependencies();
  }
}
