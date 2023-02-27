class ServerException implements Exception {
  final String message;
  ServerException({this.message = 'Server Exception'});
}

class EmptyCacheException implements Exception {
  final String message;
  EmptyCacheException({this.message = 'Empty Cache Exception'});
}

class OfflineException implements Exception {
  final String message;
  OfflineException({this.message = 'Offline Exception'});
}
