class ServerException implements Exception {}

class CacheException implements Exception {}

class ApiException implements Exception {}

class InternalException implements Exception {}

class ModelException implements Exception {
  final String generic;

  ModelException(this.generic);
}

class UnauthenticatedException implements Exception {}
