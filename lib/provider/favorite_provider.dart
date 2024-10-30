import 'dart:convert';

import 'package:http/http.dart';
import 'package:stadium/models/favorite_model.dart';
import 'package:stadium/models/staduim_model.dart';
import 'package:stadium/provider/base_provider.dart';

class FavoriteProvider extends BaseProvider {
  List<FavoriteModel> favoriteModel = [];
  List<StadiumsModel> staduimModel = [];

  Future getStaduim() async {
    staduimModel.clear();
    setLoading(true);
    setError(false);
    Response response = await api.get("favorites/stadiums");
    if (response.statusCode == 200) {
      var data = json.decode(response.body)['stadiums'];
      for (var item in data) {
        staduimModel.add(StadiumsModel.fromJson(item));
      }
      setLoading(false);
      setError(false);
    } else {
      setLoading(false);
      setError(true);
    }
  }

  Future getFavorite() async {
    favoriteModel.clear();
    setLoading(true);
    setError(false);
    var response = await api.get("favorites");
    if (response.statusCode == 200) {
      var data = json.decode(response.body)['favorites'];

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

  Future<bool> addFavorite(Map body) async {
    setLoading(true);
    setError(false);

    Response response = await api.post("favorites/add", body);
    if (response.statusCode == 201) {
      setLoading(false);
      setError(false);
      return true;
    } else if (response.statusCode == 200) {
      setLoading(false);
      setError(false);
      return true;
    } else {
      setLoading(false);
      setError(true);
      return false;
    }
  }
}
