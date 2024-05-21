import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

abstract class PlatformManager {
  static final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  static Future<String> getDeviceModel() async {
    try {
      if (Platform.isIOS) {
        final IosDeviceInfo iosInfo = await _deviceInfoPlugin.iosInfo;
        return iosInfo.utsname.machine;
      } else if (Platform.isAndroid) {
        final AndroidDeviceInfo androidInfo = await _deviceInfoPlugin.androidInfo;
        return androidInfo.model;
      } else {
        return '';
      }
    } catch (_) {
      return '';
    }
  }

  static Future<String> getDeviceId() async {
    try {
      if (Platform.isIOS) {
        final IosDeviceInfo iosInfo = await _deviceInfoPlugin.iosInfo;
        return iosInfo.identifierForVendor ?? '';
      } else if (Platform.isAndroid) {
        final AndroidDeviceInfo androidInfo = await _deviceInfoPlugin.androidInfo;
        return androidInfo.id;
      } else {
        return '';
      }
    } catch (_) {
      return '';
    }
  }

  static Future<int> getAndroidSdkVersion() async {
    final AndroidDeviceInfo androidInfo = await _deviceInfoPlugin.androidInfo;
    return androidInfo.version.sdkInt;
  }
}
