import 'dart:convert';

Cycle cycleFromJson(String str) => Cycle.fromJson(json.decode(str));

String cycleToJson(Cycle data) => json.encode(data.toJson());

class Cycle {
  Cycle({
    this.idUser,
    this.idActivity,
    this.dateStart,
    this.dateEnd,
    this.active,
  });

  int idUser;
  int idActivity;
  String dateStart;
  String dateEnd;
  bool active;

  factory Cycle.fromJson(Map<String, dynamic> json) => Cycle(
        idUser: json["idUser"],
        idActivity: json["idActivity"],
        dateStart: json["dateStart"],
        dateEnd: json["dateEnd"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "idUser": idUser,
        "idActivity": idActivity,
        "dateStart": dateStart,
        "dateEnd": dateEnd,
        "active": active,
      };
}
