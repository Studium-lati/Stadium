import 'dart:convert';

class MatchModel {
    User user1;
    User user2;

    MatchModel({
        required this.user1,
        required this.user2,
    });

    factory MatchModel.fromRawJson(String str) => MatchModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MatchModel.fromJson(Map<String, dynamic> json) => MatchModel(
        user1: User.fromJson(json["user1"]),
        user2: User.fromJson(json["user2"]),
    );

    Map<String, dynamic> toJson() => {
        "user1": user1.toJson(),
        "user2": user2.toJson(),
    };
}

class User {
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

    User({
        required this.id,
        required this.name,
        required this.phone,
        required this.role,
        required this.email,
        required this.emailVerifiedAt,
        required this.avatar,
        required this.cover,
        required this.createdAt,
        required this.updatedAt,
    });

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
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
