import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    this.id,
    this.name,
    this.colot,
  });

  int id;
  String name;
  String colot;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        colot: json["colot"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "colot": colot,
      };
}
