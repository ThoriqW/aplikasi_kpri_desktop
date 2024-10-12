class ErrorResponse {
  final String errors;

  ErrorResponse({
    required this.errors,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(errors: json['errors']);
  }
}
