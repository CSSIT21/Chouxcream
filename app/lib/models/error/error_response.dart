class ErrorResponse {
  bool success;
  String code;
  String message;

  ErrorResponse(this.success, this.code, this.message);

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(json['success'], json['code'], json['message']);
  }
}
