import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class InternetStatus {
  Future<bool> get isConnected;
}

class InternetStatusImplementer implements InternetStatus {
  InternetStatusImplementer({
    required this.connectionChecker,
  });

  final InternetConnectionChecker connectionChecker;

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
