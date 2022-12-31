class DeviceInfo {
  DeviceInfo({
    required this.identifier,
    required this.platform,
    required this.type,
  });

  final String identifier;
  final DevicePlatform platform;
  final String type;
}

enum DevicePlatform {
  ios('ios'),
  android('android'),
  web('web'),
  linux('linux'),
  macOs('macOs'),
  windows('windows');

  const DevicePlatform(this.value);

  final String value;
}
