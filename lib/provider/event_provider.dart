import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:stadium/models/event_model.dart';
import 'package:stadium/provider/base_provider.dart';
import 'package:provider/provider.dart';
import 'package:stadium/provider/staduim_provider.dart';

class EventProvider extends BaseProvider {
  List<EventModel> events = [];
  Future getEvent(context) async {
    events.clear();
    setLoading(true);
    setError(false);

    try {
      // Load stadiums first
      await Provider.of<StaduimProvider>(context, listen: false).getStaduim();
      await Provider.of<StaduimProvider>(context, listen: false).getStaduim();

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
    } catch (e) {
      setLoading(false);
      setError(true);
      debugPrint("Error fetching events: $e");
    }
  }
}
