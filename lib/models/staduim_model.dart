import 'dart:convert';

import './image_model.dart';
import './user_model.dart';

class StadiumsModel {
  int id;
  String name;
  String? description;
  List<ImageModel> images;
  String location;
  double latitude;
  double longitude;
  String pricePerHour;
  String capacity;
  double rating;
  String status;
  UserModel? user; 
  DateTime createdAt;
  DateTime updatedAt;


  StadiumsModel({
    required this.id,
    required this.name,
    this.description,
    required this.images,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.pricePerHour,
    required this.capacity,
    required this.rating,
    required this.status,
    this.user, 
    required this.createdAt,
    required this.updatedAt,
  });

  factory StadiumsModel.fromRawJson(String str) =>
      StadiumsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StadiumsModel.fromJson(Map<String, dynamic> json) => StadiumsModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        images: List<ImageModel>.from(
            json["images"].map((x) => ImageModel.fromJson(x))),
        location: json["location"],
        latitude: _parseDouble(json["latitude"]),
        longitude: _parseDouble(json["longitude"]),
        pricePerHour: json["price_per_hour"],
        capacity: json["capacity"],
        rating: _parseDouble(json["rating"]),
        status: json["status"],
        user: json["user"] != null ? UserModel.fromJson(json["user"]) : null,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "location": location,
        "latitude": latitude,
        "longitude": longitude,
        "price_per_hour": pricePerHour,
        "capacity": capacity,
        "rating": rating,
        "status": status,
        "user": user?.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  static double _parseDouble(dynamic value) {
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }
}
