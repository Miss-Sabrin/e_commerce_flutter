// To parse this JSON data, do
//
//     final categoriestModel = categoriestModelFromJson(jsonString);

import 'dart:convert';

UserModel usertModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String usertModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String id;
    String? image;
    String name;
    String email;

    UserModel({
        required this.id,
         this.image,
        required this.name,
        required this.email
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        email: json['email']
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name":name,
        "email":email
    };
}
