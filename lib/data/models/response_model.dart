class ResponseModel {
  String? message;
  bool isError;
  String? errorCode;

  ResponseModel({
    this.message,
    this.isError = false,
    this.errorCode,
  });

  @override
  String toString() {
    return 'Message: $message\nisError: $isError\nerrorCode: $errorCode';
  }
}
