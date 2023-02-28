class ServerException implements Exception {
  final String message;
  ServerException({this.message = 'Server Exception'});
}

class LocalStorageException implements Exception {
  final String message;
  LocalStorageException({this.message = 'Local Storage Exception'});
}

class OfflineException implements Exception {
  final String message;
  OfflineException({this.message = 'Offline Exception'});
}
