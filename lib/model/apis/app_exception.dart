class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataExcption extends AppException {
  FetchDataExcption([String? message])
      : super(message, "Error during communications.");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request");
}

class UnAuthorisedException extends AppException {
  UnAuthorisedException([message]) : super(message, "Unauthorised Request");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid input");
}
