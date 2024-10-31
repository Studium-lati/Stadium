import 'dart:convert';

class ReservationsModel {
  String? stadiumId;
  String? userId;
  DateTime? date;
  String? time;
  String? duration;
  String price;
  String status;
  String? deposit;
  String id;

  ReservationsModel({
    this.stadiumId,
    this.userId,
    this.date,
    this.time,
    this.duration = '1',
    this.price = " ",
    this.deposit,
    this.id = "",
    this.status = "pending",
  });

  factory ReservationsModel.fromRawJson(String str) =>
      ReservationsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReservationsModel.fromJson(Map<String, dynamic> json) =>
      ReservationsModel(
        stadiumId: json["stadium_id"],
        userId: json["user_id"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        duration: json["duration"],
        price: json["price"],
        deposit: json["deposit"],
        id: json["id"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "stadium_id": stadiumId,
        "user_id": userId,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "time": time,
        "duration": duration,
        "price": price,
        "deposit": deposit,
        "id": id,
        "status": status,
      };
}
