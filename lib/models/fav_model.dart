import 'package:stadium/models/event_model.dart';
import 'package:stadium/models/staduim_model.dart';

class FavoriteModel {
  final int id;
  final String favoritableType;
  final int favoritableId;
  final dynamic favoritable; // Can be StadiumsModel or EventModel

  FavoriteModel({
    required this.id,
    required this.favoritableType,
    required this.favoritableId,
    required this.favoritable,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    
    return FavoriteModel(
      id: json['id'],
      favoritableType: json['favoritable_type'],
      favoritableId: json['favoritable_id'],
      favoritable: _parseFavoritable(json),
    );
  }

  static dynamic _parseFavoritable(Map<String, dynamic> json) {
    if (json['favoritable_type'] == 'Stadium') {
      return StadiumsModel.fromJson(json['favoritable']);
    } else if (json['favoritable_type'] == 'Event') {
      return EventModel.fromJson(json['favoritable']);
    }
    return null;
  }
}
