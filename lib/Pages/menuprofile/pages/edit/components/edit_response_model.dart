// File: models/update_profile_model.dart
class UpdateProfileResponse {
  final bool success;
  final String message;
  final UserData data;

  UpdateProfileResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) {
    return UpdateProfileResponse(
      success: json['success'],
      message: json['message'],
      data: UserData.fromJson(json['data']),
    );
  }
}

class UserData {
  final String name;
  final String image;

  UserData({
    required this.name,
    required this.image,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
    };
  }
}
