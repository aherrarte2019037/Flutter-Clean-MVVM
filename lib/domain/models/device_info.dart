class DeviceInfo {
  const DeviceInfo({
    required this.identifier,
    required this.platform,
    required this.name,
  });

  const DeviceInfo.unknown()
      : identifier = 'unknown',
        platform = DevicePlatform.unknown,
        name = 'unknown';

  final String identifier;
  final DevicePlatform platform;
  final String name;
}

enum DevicePlatform {
  ios('ios'),
  android('android'),
  fuchsia('fuchsia'),
  web('web'),
  linux('linux'),
  macOs('macOs'),
  windows('windows'),
  unknown('unknown');

  const DevicePlatform(this.value);

  final String value;
}
