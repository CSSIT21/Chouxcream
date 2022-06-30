class RegisterResponse {
  bool success;
  String code;
  String message;

  RegisterResponse(
      {required this.success, required this.code, required this.message});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
        success: json['success'], code: json['code'], message: json['message']);
  }
}
