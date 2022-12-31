class LoginParams {
  const LoginParams({
    required this.email,
    required this.password,
    required this.deviceIdentifier,
    required this.devicePlatform,
    required this.deviceType,
  });
  
  final String email;
  final String password;
  final String deviceIdentifier;
  final String devicePlatform;
  final String deviceType;
}
