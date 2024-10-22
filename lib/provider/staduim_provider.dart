import 'dart:convert';
import 'package:http/http.dart';
import 'package:stadium/models/staduim_model.dart';
import 'package:stadium/provider/base_provider.dart';

class StaduimProvider extends BaseProvider {
  List<StadiumsModel> stadiums = [];
  List<StadiumsModel> beststadiums = [];

  Future getBestStaduim() async {
    beststadiums.clear();
    setLoading(true);
    setError(false);
    Response response = await api.get("stadiums/best");
    if (response.statusCode == 200) {
      var data = json.decode(response.body)['data'];
      for (var item in data) {
        beststadiums.add(StadiumsModel.fromJson(item));
      }
      setLoading(false);
      setError(false);
    } else {
      setLoading(false);
      setError(true);
    }
  }

  Future getStaduim() async {
    stadiums.clear();
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
}
