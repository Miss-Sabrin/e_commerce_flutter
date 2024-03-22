// To parse this JSON data, do
//
//     final categoriestModel = categoriestModelFromJson(jsonString);

import 'dart:convert';

CategoriestModel categoriestModelFromJson(String str) => CategoriestModel.fromJson(json.decode(str));

String categoriestModelToJson(CategoriestModel data) => json.encode(data.toJson());

class CategoriestModel {
    String id;
    String image;

    CategoriestModel({
        required this.id,
        required this.image,
    });

    factory CategoriestModel.fromJson(Map<String, dynamic> json) => CategoriestModel(
        id: json["id"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
    };
}
