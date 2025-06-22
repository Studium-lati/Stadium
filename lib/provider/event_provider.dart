import 'dart:convert';

import 'package:http/http.dart';
import 'package:stadium/models/event_model.dart';
import 'package:stadium/provider/base_provider.dart';

class EventProvider extends BaseProvider {
  List<EventModel> events = [];
  bool _hasInitialized = false;

  Future getEvent({bool forceRefresh = false}) async {
    // Prevent multiple simultaneous calls
    if (isLoading) {
      return;
    }

    // If already loaded and not forcing refresh, don't reload
    if (_hasInitialized && !forceRefresh && events.isNotEmpty) {
      return;
    }

    try {
      setLoading(true);
      setError(false);

      print("GET events"); // Debug log
      Response response = await api.get("events");
      print("Response: ${response.body}");
      print("Status Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        events.clear();
        var responseData = json.decode(response.body);
        var data = responseData['data'];

        if (data != null && data is List) {
          for (var item in data) {
            try {
              events.add(EventModel.fromJson(item));
            } catch (e) {
              print("Error parsing event: $e");
              print("Event data: $item");
            }
          }
          _hasInitialized = true;
        }

        setLoading(false);
        setError(false);
      } else {
        setLoading(false);
        setError(true);
        print("Error fetching events: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception in getEvent: $e");
      setLoading(false);
      setError(true);
    }
  }

  // Method to refresh events
  Future refreshEvents() async {
    await getEvent(forceRefresh: true);
  }

  // Reset initialization when disposed
  @override
  void dispose() {
    _hasInitialized = false;
    events.clear();
    super.dispose();
  }
}
