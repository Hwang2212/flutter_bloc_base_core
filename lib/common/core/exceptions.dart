import 'package:equatable/equatable.dart';

class ServerException implements Exception {}

class CacheException implements Exception {}

class RouteException implements Exception {}

/// Failures

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class NetworkFailure extends Failure {}

class ExceptionFailure extends Failure {}

class CredentialFailure extends Failure {}

class AuthenticationFailure extends Failure {}
