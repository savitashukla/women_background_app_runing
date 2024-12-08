
abstract class Failure  {
  final String message;
  const Failure(this.message);

}

class Exception extends Failure {
  const Exception(String message) : super(message);
}

class LocalDatabaseQueryFailure extends Failure {
  const LocalDatabaseQueryFailure(String message) : super(message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(String message) : super(message);
}

class ParsingFailure extends Failure {
  const ParsingFailure(String message) : super(message);
}

class EmailRegisterFailure extends Failure {
  final List? emailSuggestions;
  const EmailRegisterFailure(String message, {this.emailSuggestions})
      : super(message);
}

class ApiFailure extends Failure {
  const ApiFailure(String message) : super(message);
}
