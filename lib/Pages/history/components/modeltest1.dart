class StatusResponse {
  final bool status;
  final String message;
  final List<String> data;

  StatusResponse({required this.status, required this.message, required this.data});

  factory StatusResponse.fromJson(Map<String, dynamic> json) {
    return StatusResponse(
      status: json['status'],
      message: json['message'],
      data: List<String>.from(json['data']),
    );
  }
}
