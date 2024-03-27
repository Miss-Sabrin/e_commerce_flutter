// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    String id;
    String name;
    String description;
    bool isFavrite;
    double price;
    String status;
    String image;
    int? qty;

    ProductModel({
      
        required this.id,
        required this.name,
        required this.description,
        required this.isFavrite,
        required this.price,
        required this.status,
        required this.image,
        this.qty

    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        isFavrite: false,
        price: double.parse( json["price"].toString()),
        status: json["status"],
        image:json["image"],
        qty: json['qty']
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "isFavrite": isFavrite,
        "price": price,
        "status": status,
        "image":image,
        "qty":qty,
    };

    @override
    ProductModel copyWith({
      int?   qty,
    })=>
    ProductModel(
      id: id,
       name: name,
        description: description,
         isFavrite: isFavrite, 
         price:  price,
         qty: qty?? this.qty,
          status: status, 
          image: image
          );
}
