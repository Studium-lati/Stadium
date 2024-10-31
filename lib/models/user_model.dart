import 'dart:convert';

class UserModel {
  int id;
  String name;
  String phone;
  String role;
  String email;
  String? emailVerifiedAt;
  String? avatar;
  String? cover;
  DateTime createdAt;
  DateTime updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.role,
    required this.email,
    this.emailVerifiedAt,
    this.avatar,
    this.cover,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        role: json["role"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        avatar: json["avatar"],
        cover: json["cover"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "role": role,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "avatar": avatar,
        "cover": cover,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
