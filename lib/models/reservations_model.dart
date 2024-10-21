import 'dart:convert';

class ReservationsModel {
    String ?stadiumId;
    DateTime? date;
    String ?time;
    String? duration;
    String ?deposit;

    ReservationsModel({
         this.stadiumId,
         this.date,
         this.time,
         this.duration,
         this.deposit,
    });

    factory ReservationsModel.fromRawJson(String str) => ReservationsModel.fromJson(json.decode(str));
    String toRawJson() => json.encode(toJson());
    factory ReservationsModel.fromJson(Map<String, dynamic> json) => ReservationsModel(
        stadiumId: json["stadium_id"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        duration: json["duration"],
        deposit: json["deposit"],
    );

    Map<String, dynamic> toJson() => {
        "stadium_id": stadiumId,
        "date": "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        "time": time,
        "duration": duration,
        "deposit": deposit,
    };
}
