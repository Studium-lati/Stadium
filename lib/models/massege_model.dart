import 'dart:convert';

class MessageModel {
    int senderId;
    int receiverId;
    String message;

    MessageModel({
        required this.senderId,
        required this.receiverId,
        required this.message,
    });

    factory MessageModel.fromRawJson(String str) => MessageModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        senderId: json["sender_id"],
        receiverId: json["receiver_id"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "sender_id": senderId,
        "receiver_id": receiverId,
        "message": message,
    };
}
