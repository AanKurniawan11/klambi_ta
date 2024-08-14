class UploadImageResponse {
  final bool success;
  final String message;
  final UploadImageData data;

  UploadImageResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UploadImageResponse.fromJson(Map<String, dynamic> json) {
    return UploadImageResponse(
      success: json['success'],
      message: json['message'],
      data: UploadImageData.fromJson(json['data']),
    );
  }
}

class UploadImageData {
  final int userId;
  final String path;
  final int id;

  UploadImageData({
    required this.userId,
    required this.path,
    required this.id,
  });

  factory UploadImageData.fromJson(Map<String, dynamic> json) {
    return UploadImageData(
      userId: json['user_id'],
      path: json['path'],
      id: json['id'],
    );
  }
}
