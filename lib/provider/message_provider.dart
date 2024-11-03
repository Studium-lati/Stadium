import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stadium/helper/const.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/models/massege_model.dart';
import 'package:stadium/provider/base_provider.dart';
import 'package:ably_flutter/ably_flutter.dart' as ably;


class MessageProvider extends BaseProvider {
  List<MessageModel> messages = [];


  void getMessagesRealTime(
      int receiverId,
   int senderId 
  ) async {
    final realTimeMessage = ably.Realtime(
        key: "QWglvg.2W4_nQ:N442e1zudjezjDuRPv4RmPTMelOeCdam-ufeNKu0Kok");
    realTimeMessage.connection
        .on(ably.ConnectionEvent.connected)
        .listen((ably.ConnectionStateChange newMeassage) async {
      switch (newMeassage.current) {
        case ably.ConnectionState.connected:
          print('Connected to Ably!');
          break;
        case ably.ConnectionState.failed:
          print('The connection to Ably failed.');
          // Failed connection
          break;
        default:
          break;
      }

      final channel = realTimeMessage.channels.get(chatChannel(receiverId, senderId));
      channel.subscribe().listen((message) {
        print('Received message: ${message.data}');
        final json = jsonDecode(message.data as String);
        messages.add(MessageModel(
          senderId: json["sender_id"],
          receiverId: int.parse(json["receiver_id"]),
          message: json["message"],
        ));
        notifyListeners();
      });
    });

  }
  Future<List> sendMessage(Map body) async {
      http.Response response = await api.post("chat/", body);
      if (response.statusCode == 201) {
        
       
        setLoading(false);
        setError(false);
        return [true, json.decode(response.body)];
      } else {
        setLoading(false);
        setError(true);
        return [false, json.decode(response.body)];
      }
    }
    Future getMessages(int id) async {
      messages.clear();
      setLoading(true);
      setError(false);
      var response = await api.get("chat/$id");
      if (response.statusCode == 200) {
        var data = json.decode(response.body)['messages'];
        messages =
            List<MessageModel>.from(data.map((x) => MessageModel.fromJson(x)));
        setLoading(false);
        setError(false);
      } else {
        setLoading(false);
        setError(true);
      }
    }
}
