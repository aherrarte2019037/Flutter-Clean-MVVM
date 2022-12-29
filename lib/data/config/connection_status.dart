import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class ConnectionStatus {
  Future<bool> get isConnected;
}

class ConnectionStatusImpl implements ConnectionStatus {
  ConnectionStatusImpl({
    required this.connectionChecker,
  });

  final InternetConnectionChecker connectionChecker;

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
