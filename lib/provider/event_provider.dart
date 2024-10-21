import 'dart:convert';

import 'package:http/http.dart';
import 'package:stadium/models/event_model.dart';
import 'package:stadium/provider/base_provider.dart';

class EventProvider extends BaseProvider {
  List<EventModel> events = [];

  Future getEvent() async {
    setLoading(true);
    setError(false);
    Response response = await api.get("events");
    if (response.statusCode == 200) {
      var data = json.decode(response.body)['data'];
      for (var item in data) {
        events.add(EventModel.fromJson(item));
      }
      setLoading(false);
      setError(false);
    } else {
      setLoading(false);
      setError(true);
    }
  }
}
