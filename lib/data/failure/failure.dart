abstract class BaurFailure {}

class UnknownFailure implements BaurFailure {}

class ServerFailure implements BaurFailure {
  final int statusCode;
  final String body;

  ServerFailure({
    required this.statusCode,
    required this.body,
  });
}
