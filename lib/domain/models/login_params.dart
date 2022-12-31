class LoginParams {
  const LoginParams({
    required this.email,
    required this.password,
    required this.imei,
    required this.devicePlatform,
    required this.deviceType,
  });
  
  final String email;
  final String password;
  final String imei;
  final String devicePlatform;
  final String deviceType;
}
