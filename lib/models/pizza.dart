class Pizza {
  String? pizzaId;
  String? name;
  String? description;
  String? image;
  double? price;
  double? rating;

  Pizza({
    this.name,
    this.description,
    this.image,
    this.price,
    this.pizzaId,
    this.rating,
  });

  Pizza.fromJson(Map<String, dynamic> json) {
    pizzaId = json['pizzaId'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pizzaId'] = this.pizzaId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price'] = this.price;
    data['rating'] = this.rating;
    return data;
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class PizzaModel {
//   String? id;
//   String? image;
//   String? title;
//   String? price;
//   String? description;
//   Timestamp? timestamp;
//
//   PizzaModel({
//     this.id,
//     this.image,
//     this.title,
//     this.description,
//     this.price,
//     this.timestamp,
//   });
//   PizzaModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     image = json['image'];
//     title = json['name'];
//     price = json['price'];
//     description = json['description'];
//     timestamp = json['timestamp'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['image'] = this.image;
//     data['name'] = this.title;
//     data['price'] = this.price;
//     data['description'] = this.description;
//     data['timestamp'] = this.timestamp;
//
//     return data;
//   }
// }
//
// // import 'package:cloud_firestore/cloud_firestore.dart';
// //
// // class PizzaModel {
// //   final String image, title, description;
// //   final double price, size, id, rating;
// //
// //   PizzaModel({
// //     this.image,
// //     this.title,
// //     this.description,
// //     this.price,
// //     this.size,
// //     this.id,
// //     this.rating,
// //   });
// //
// //   PizzaModel.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     return data;
// //   }
// //   Map<String, dynamic> toJson() {
// //     data['id'] = this.id;
// //     return data;
// //   }
// // }
