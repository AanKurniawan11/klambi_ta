// To parse this JSON data, do
//
//     final addRatingModel = addRatingModelFromJson(jsonString);

import 'dart:convert';

AddRatingModel addRatingModelFromJson(String str) => AddRatingModel.fromJson(json.decode(str));

String addRatingModelToJson(AddRatingModel data) => json.encode(data.toJson());

class AddRatingModel {
  int productId;
  int rating;
  String review;

  AddRatingModel({
    required this.productId,
    required this.rating,
    required this.review,
  });

  factory AddRatingModel.fromJson(Map<String, dynamic> json) => AddRatingModel(
    productId: json["product_id"],
    rating: json["rating"],
    review: json["review"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "rating": rating,
    "review": review,
  };
}
