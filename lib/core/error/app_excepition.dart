class AppException implements Exception {
  String? message;
  String? prefix;

  AppException([this.message, this.prefix]);

  @override
  String toString() {
    return "$prefix$message";
  }
}
// here the messages should be from the backed response for now I made it fixed

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class NoInternet extends AppException {
  NoInternet([String? message]) : super(message, "Check your Internet");
}

class NotFound extends AppException {
  NotFound([String? message]) : super(message, "not found 404");
}

class InternalServerError extends AppException {
  InternalServerError([String? message])
      : super(message, "Internal Server Error");
}
