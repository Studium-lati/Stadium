import 'dart:convert';

class EventModel {
  int id;
  String name;
  String description;
  String date;
  String image;
  String status;
  int stadiumId;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  EventModel({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.image,
    required this.status,
    required this.stadiumId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory EventModel.fromRawJson(String str) =>
      EventModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        date: json["date"],
        image: json["image"],
        status: json["status"],
        stadiumId: json["stadium_id"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "date": date,
        "image": image,
        "status": status,
        "stadium_id": stadiumId,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
