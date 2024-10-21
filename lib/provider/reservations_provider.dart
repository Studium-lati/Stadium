import 'dart:convert';
import 'package:flutter/src/material/time.dart';
import 'package:http/http.dart' as http;
import 'package:stadium/models/reservations_model.dart';
import 'package:stadium/provider/base_provider.dart';

class ReservationsProvider  extends BaseProvider {
 ReservationsModel? reservationsModel ;

  List<ReservationsModel> reservations = [];
  List<ReservationsModel> get getReservations => reservations;
  Future<void> fetchReservations() async {
    setLoading(true);
    setError(false);
    http.Response response = await api.get("reservations");
    if (response.statusCode == 200) {
      var data = json.decode(response.body)['data'];
      for (var item in data) {
        reservations.add(ReservationsModel.fromJson(item));
      }
      setLoading(false);
      setError(false);
    } else {
      setLoading(false);
      setError(true);
    }
  }
  Future<List> addReservation(Map body) async {
    setLoading(true);
    setError(false);
    http.Response response = await api.post("reservation", body);
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

  
 // Future<List> getReservationById(int id) async {
   // setLoading(true);
   // setError(false);
    //http.Response response = await api.get(Uri.parse("reservation/$id"));
   // if (response.statusCode == 200) {
   //   setLoading(false);
    //  setError(false);
   //   return [true, json.decode(response.body)['data']];
   // } else {
    //  setLoading(false);
    //  setError(true);
    //  return [false, json.decode(response.body)['message']];
  //  } 
}



