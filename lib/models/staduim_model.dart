import 'dart:convert';

class StadiumsModel {
    int id;
    String name;
    String location;
    int latitude;
    int longitude;
    String pricePerHour;
    String capacity;
    String? image;
    String? description;
    double rating;
    String status;
    int userId;
    DateTime createdAt;
    DateTime updatedAt;

    StadiumsModel({
        required this.id,
        required this.name,
        required this.location,
        required this.latitude,
        required this.longitude,
        required this.pricePerHour,
        required this.capacity,
         this.image,
         this.description,
        required this.rating,
        required this.status,
        required this.userId,
        required this.createdAt,
        required this.updatedAt,
    });

    factory StadiumsModel.fromRawJson(String str) => StadiumsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory StadiumsModel.fromJson(Map<String, dynamic> json) => StadiumsModel(
        id: json["id"],
        name: json["name"],
        location: json["location"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        pricePerHour: json["price_per_hour"],
        capacity: json["capacity"],
        image: json["image"],
        description: json["description"],
        rating: json["rating"]?.toDouble(),
        status: json["status"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "location": location,
        "latitude": latitude,
        "longitude": longitude,
        "price_per_hour": pricePerHour,
        "capacity": capacity,
        "image": image,
        "description": description,
        "rating": rating,
        "status": status,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
