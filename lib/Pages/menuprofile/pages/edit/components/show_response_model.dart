// File: models/show_profile_model.dart
class ShowProfileResponse {
  final bool success;
  final String message;
  final UserProfile data;

  ShowProfileResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ShowProfileResponse.fromJson(Map<String, dynamic> json) {
    return ShowProfileResponse(
      success: json['success'],
      message: json['message'],
      data: UserProfile.fromJson(json['data']),
    );
  }
}

class UserProfile {
  final String name;
  final String email;
  final String image;

  UserProfile({
    required this.name,
    required this.email,
    required this.image,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['name'],
      email: json['email'],
      image: json['image'],
    );
  }
}
