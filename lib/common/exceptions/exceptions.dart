class CacheException implements Exception {}

class ApiException implements Exception {}

class InternalServerException implements Exception {}

class ModelException implements Exception {
  final String generic;

  ModelException(this.generic);
}

class UnauthenticatedException implements Exception {}
