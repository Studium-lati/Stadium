import 'dart:convert';

class FavoriteModel {
  int id;
  int userId;
  int stadiumId;
  DateTime createdAt;
  DateTime updatedAt;

  FavoriteModel({
    required this.id,
    required this.userId,
    required this.stadiumId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FavoriteModel.fromRawJson(String str) =>
      FavoriteModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        id: json["id"],
        userId: json["user_id"],
        stadiumId: json["stadium_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "stadium_id": stadiumId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
