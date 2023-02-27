import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class InternetInfo {
  Future<bool> get isConnected;
}

class InternetInfoImpl implements InternetInfo {
  final InternetConnectionChecker connectionChecker;

  InternetInfoImpl(this.connectionChecker);
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
