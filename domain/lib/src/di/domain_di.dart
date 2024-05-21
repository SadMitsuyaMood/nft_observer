import 'package:domain/src/notification/notification.dart';

abstract class DomainDI {
  static void registerDependencies() {
    NotificationDI.registerDependencies();
  }
}
