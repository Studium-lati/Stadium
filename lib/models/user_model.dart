import 'dart:convert';

class UserModel {
  int id;
  String name;
  String phoneNumber;
  String type;
  List<String> roles;
  String? avatar;
  String? cover;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.type,
    required this.roles,
    this.avatar,
    this.cover,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        type: json["type"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        avatar: json["avatar"],
        cover: json["cover"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone_number": phoneNumber,
        "type": type,
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "avatar": avatar,
        "cover": cover,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
