// To parse this JSON data, do
//
//     final categoriestModel = categoriestModelFromJson(jsonString);

import 'dart:convert';

CategoriestModel categoriestModelFromJson(String str) => CategoriestModel.fromJson(json.decode(str));

String categoriestModelToJson(CategoriestModel data) => json.encode(data.toJson());

class CategoriestModel {
    String id;
    String image;
    String name;

    CategoriestModel({
        required this.id,
        required this.image,
        required this.name,
    });

    factory CategoriestModel.fromJson(Map<String, dynamic> json) => CategoriestModel(
        id: json["id"],
        image: json["image"],
        name: json["name"]
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name":name,
    };
}
