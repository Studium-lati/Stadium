import 'dart:convert';

import 'package:stadium/models/image_model.dart';
import 'package:stadium/models/staduim_model.dart';
import 'package:stadium/models/user_model.dart';

class EventModel {
  int id;
  int? get stadiumId => stadium?.id;
  String name;
  String? description;
  String? date; 
  List<ImageModel> images; 
  String status;
  StadiumsModel? stadium; 
  UserModel? user; 
  DateTime createdAt;
  DateTime updatedAt;

  EventModel({
    required this.id,
    required this.name,
    this.description,
    this.date,
    required this.images,
    required this.status,
    this.stadium,
    this.user,
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
        images: (json["images"] as List<dynamic>?)
                ?.map((x) => ImageModel.fromJson(x))
                .toList() ??
            [],
        status: json["status"],
        stadium: json["stadium"] != null
            ? StadiumsModel.fromJson(json["stadium"])
            : null,
        user: json["user"] != null ? UserModel.fromJson(json["user"]) : null,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "date": date,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "status": status,
        "stadium": stadium?.toJson(),
        "user": user?.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
