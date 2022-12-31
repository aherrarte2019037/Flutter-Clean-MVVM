import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:tutapp/domain/models/device_info.dart';

abstract class DeviceInfoRepository {
  Future<DeviceInfo> getInfo();
}

class DeviceInfoRepositoryImpl implements DeviceInfoRepository {
  const DeviceInfoRepositoryImpl(
    this._deviceInfoPlugin,
  );

  final DeviceInfoPlugin _deviceInfoPlugin;

  @override
  // ignore: long-method
  Future<DeviceInfo> getInfo() async {
    try {
      String? identifier;
      String? name;
      DevicePlatform platform = DevicePlatform.unknown;

      if (Platform.isIOS) {
        final iosInfo = await _deviceInfoPlugin.iosInfo;
        identifier = iosInfo.identifierForVendor;
        platform = DevicePlatform.ios;
        name = iosInfo.name;
      }

      if (Platform.isAndroid || Platform.isFuchsia) {
        final androidInfo = await _deviceInfoPlugin.androidInfo;
        identifier = androidInfo.id;
        platform = Platform.isAndroid ? DevicePlatform.android : DevicePlatform.fuchsia;
        name = '${androidInfo.manufacturer} ${androidInfo.model}';
      }

      if (kIsWeb) {
        final webInfo = await _deviceInfoPlugin.webBrowserInfo;
        identifier = webInfo.userAgent;
        platform = DevicePlatform.web;
        name = webInfo.browserName.name;
      }

      if (Platform.isLinux) {
        final linuxInfo = await _deviceInfoPlugin.linuxInfo;
        identifier = linuxInfo.id;
        platform = DevicePlatform.linux;
        name = linuxInfo.prettyName;
      }

      if (Platform.isMacOS) {
        final macInfo = await _deviceInfoPlugin.macOsInfo;
        identifier = macInfo.systemGUID;
        platform = DevicePlatform.macOs;
        name = macInfo.model;
      }

      if (Platform.isWindows) {
        final windowsInfo = await _deviceInfoPlugin.windowsInfo;
        identifier = windowsInfo.deviceId;
        platform = DevicePlatform.windows;
        name = windowsInfo.productName;
      }

      return DeviceInfo(
        identifier: identifier ?? 'unknown',
        platform: platform,
        name: name ?? 'unknown',
      );
    } on PlatformException {
      return const DeviceInfo.unknown();
    }
  }
}
