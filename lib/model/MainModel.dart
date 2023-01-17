import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? image;
  String? name;

  String? price;
  List<dynamic>? actor;
  String? id;

  ProductModel({
    this.image,
    this.name,
    this.price,
    this.actor,
    this.id,
  });

  ProductModel.fromMap(DocumentSnapshot data) {
    image = data['image'];
    name = data['name'];

    price = data['price'];
    actor = data['actors'];
    id = data.id;
  }
}
