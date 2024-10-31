import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stadium/models/match_making_model.dart';
import 'package:stadium/models/reservations_model.dart';
import 'package:stadium/provider/base_provider.dart';

class ReservationsProvider extends BaseProvider {
  ReservationsModel reservationsModel = ReservationsModel();
  MatchModel? matchModel;

  List<ReservationsModel> reservations = [];

  Future fetchReservations() async {
    reservations.clear();
    setLoading(true);
    setError(false);
    var response = await api.get("reservations/viewReservations");
    if (response.statusCode == 200) {
      var data = json.decode(response.body)['data'];
      data.forEach((reservation) {
        final Map<String, dynamic> reservationMap =
            Map<String, dynamic>.from(reservation);
        reservations.add(ReservationsModel.fromJson(reservationMap
            .map((key, value) => MapEntry(key, value.toString()))));
      });

      setLoading(false);
      setError(false);
    } else {
      setLoading(false);
      setError(true);
    }
  }

  Future<List> reserveStadium() async {
    setLoading(true);
    setError(false);
    // if (kDebugMode) {
    //   print(jsonEncode(reservationsModel.toJson()));
    // }
    http.Response response = await api.post("reservations/stadium", {
      "stadium_id": "${reservationsModel!.stadiumId}",
      "date": "${reservationsModel?.date}",
      "time": "${reservationsModel!.time}",
      "duration": "${reservationsModel!.duration}",
      "deposit": "${reservationsModel!.deposit}",
    });
    if (response.statusCode == 201) {
      setLoading(false);
      setError(false);
      return [true, json.decode(response.body)['message']];
    } else {
      setLoading(false);
      setError(true);
      return [false, json.decode(response.body)['message']];
    }
  }

  Future<List> randomMatchRequest(Map body) async {
    setLoading(true);
    setError(false);
    http.Response response = await api.post("random-match-request", body);

    if (response.statusCode == 200) {
      setLoading(false);
      setError(false);
      var responseData = json.decode(response.body);
      matchModel = MatchModel.fromJson(responseData);

      return [true, responseData['message']];
    } else if (response.statusCode == 202) {
      setLoading(false);
      setError(false);
      return [false, json.decode(response.body)['message']];
    } else {
      setLoading(false);
      setError(true);
      return [false, json.decode(response.body)['message']];
    }
  }
}
