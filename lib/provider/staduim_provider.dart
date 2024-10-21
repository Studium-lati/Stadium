import 'dart:convert';
import 'package:http/http.dart';
import 'package:stadium/models/staduim_model.dart';
import 'package:stadium/provider/base_provider.dart';
class StaduimProvider extends BaseProvider {
List<StadiumsModel> stadiums = [];

  Future getStaduim() async {
    setLoading(true);
    setError(false);
    Response response = await api.get("stadiums");
    if (response.statusCode == 200) {
      var data = json.decode(response.body)['data'];
      for (var item in data) {
        stadiums.add(StadiumsModel.fromJson(item));
      }
      setLoading(false);
      setError(false);
    } else {
      setLoading(false);
      setError(true);
    }
  }
  Future<List> getStaduimById(int id) async {
    setLoading(true);
    setError(false);
    Response response = await api.get("staduim/$id");
    if (response.statusCode == 200) {
      setLoading(false);
      setError(false);
      return [true, json.decode(response.body)['data']];
    } else {
      setLoading(false);
      setError(true);
      return [false, json.decode(response.body)['message']];
    }
  }

  Future<List> getStaduimByCity(String city) async {
    setLoading(true);
    setError(false);
    Response response = await api.get("staduim/city/$city");
    if (response.statusCode == 200) {
      setLoading(false);
      setError(false);
      return [true, json.decode(response.body)['data']];
    } else {
      setLoading(false);
      setError(true);
      return [false, json.decode(response.body)['message']];
    }
  }



}
