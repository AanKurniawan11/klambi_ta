// To parse this JSON data, do
//
//     final showRatingModel = showRatingModelFromJson(jsonString);

import 'dart:convert';

ShowRatingModel showRatingModelFromJson(String str) => ShowRatingModel.fromJson(json.decode(str));

String showRatingModelToJson(ShowRatingModel data) => json.encode(data.toJson());

class ShowRatingModel {
  bool success;
  String message;
  Datas data;

  ShowRatingModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ShowRatingModel.fromJson(Map<String, dynamic> json) => ShowRatingModel(
    success: json["success"],
    message: json["message"],
    data: Datas.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Datas {
  List<Rating> ratings;
  List<User> users;

  Datas({
    required this.ratings,
    required this.users,
  });

  factory Datas.fromJson(Map<String, dynamic> json) => Datas(
    ratings: List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x))),
    users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ratings": List<dynamic>.from(ratings.map((x) => x.toJson())),
    "users": List<dynamic>.from(users.map((x) => x.toJson())),
  };
}

class Rating {
  int id;
  int productId;
  int rating;
  String review;
  DateTime createdAt;
  DateTime updatedAt;

  Rating({
    required this.id,
    required this.productId,
    required this.rating,
    required this.review,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    id: json["id"],
    productId: json["product_id"],
    rating: json["rating"],
    review: json["review"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "rating": rating,
    "review": review,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class User {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  dynamic apiToken;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.apiToken,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    apiToken: json["api_token"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "api_token": apiToken,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
