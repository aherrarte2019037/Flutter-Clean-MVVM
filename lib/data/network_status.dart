import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkStatus {
  Future<bool> get isConnected;
}

class InternetStatusImpl implements NetworkStatus {
  InternetStatusImpl({
    required this.connectionChecker,
  });

  final InternetConnectionChecker connectionChecker;

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
