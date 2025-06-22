import 'dart:convert';

class EventModel {
  int id;
  String name;
  String description;
  String date;
  List<dynamic> images; // Changed to List to match API response
  String status;
  int? stadiumId; // Made nullable for safety
  int? userId;
  DateTime createdAt;
  DateTime updatedAt;

  EventModel({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.images,
    required this.status,
    this.stadiumId,
    this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  // Helper getter to get first image URL or placeholder
  String get image {
    if (images.isNotEmpty && images[0] != null) {
      // If images array has URLs
      if (images[0] is String) {
        return images[0];
      }
      // If images array has objects with url property
      if (images[0] is Map && images[0]['url'] != null) {
        return images[0]['url'];
      }
    }
    // Return placeholder if no images
    return 'https://via.placeholder.com/400x200/0052CC/FFFFFF?text=No+Image';
  }

  factory EventModel.fromRawJson(String str) =>
      EventModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        date: json["date"] ?? '',
        images: json["images"] ?? [],
        status: json["status"] ?? 'active',
        // Handle both direct stadium_id and nested stadium object
        stadiumId: json["stadium_id"] ??
            (json["stadium"] != null ? json["stadium"]["id"] : null),
        userId: json["user_id"] ??
            (json["user"] != null ? json["user"]["id"] : null),
        createdAt: DateTime.parse(
            json["created_at"] ?? DateTime.now().toIso8601String()),
        updatedAt: DateTime.parse(
            json["updated_at"] ?? DateTime.now().toIso8601String()),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "date": date,
        "images": images,
        "status": status,
        "stadium_id": stadiumId,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
