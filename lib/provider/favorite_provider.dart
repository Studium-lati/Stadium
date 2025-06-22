import 'dart:convert';

import 'package:http/http.dart';
import 'package:stadium/models/favorite_model.dart';
import 'package:stadium/models/staduim_model.dart';
import 'package:stadium/provider/base_provider.dart';

class FavoriteProvider extends BaseProvider {
  List<FavoriteModel> favoriteModel = [];

  Future getFavorite() async {
    favoriteModel.clear();
    setLoading(true);
    setError(false);
    Response response = await api.get("favorites");
    if (response.statusCode == 200) {
      var data = json.decode(response.body)['data'];
      for (var item in data) {
        favoriteModel.add(FavoriteModel.fromJson(item));
      }
      setLoading(false);
      setError(false);
    } else {
      setLoading(false);
      setError(true);
    }
  }

  Future<bool> favoriteStadium(int stadiumId) async {
    setLoading(true);
    setError(false);
    Response response = await api.post("favorites/stadiums/$stadiumId", {});
    setLoading(false);
    return response.statusCode == 200 || response.statusCode == 201;
  }

  Future<bool> unfavoriteStadium(int stadiumId) async {
    setLoading(true);
    setError(false);
    Response response = await api.delete("favorites/stadiums/$stadiumId");
    setLoading(false);
    return response.statusCode == 200;
  }


  Future<bool> favoriteEvent(int eventId) async {
    setLoading(true);
    setError(false);
    Response response = await api.post("favorites/events/$eventId", {});
    setLoading(false);
    return response.statusCode == 200 || response.statusCode == 201;
  }

  Future<bool> unfavoriteEvent(int eventId) async {
    setLoading(true);
    setError(false);
    Response response = await api.delete("favorites/events/$eventId");
    setLoading(false);
    return response.statusCode == 200;
  }
}
