import 'package:batiktrang/models/productModel.dart';
import 'package:flutter/material.dart';

class Product {
  String? id;
  String? shopId;
  String? name;
  String? description;
  String? code;
  String? imageUrl;
  String? price;
  String? rating;
  String? isready;
  String? isFavourite;
  Product(
      {this.id,
        this.shopId,
        this.name,
        this.description,
        this.code,
        this.imageUrl,
        this.price,
        this.rating,
        this.isready,
      this.isFavourite});
  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shop_id'];
    name = json['name'];
    description = json['description'];
    code = json['code'];
    imageUrl = json['image_url'];
    price = json['price'];
    rating = json['rating'];
    isready = json['isready'];
    isFavourite = json['isFavourite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shop_id'] = this.shopId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['code'] = this.code;
    data['image_url'] = this.imageUrl;
    data['price'] = this.price;
    data['rating'] = this.rating;
    data['isready'] = this.isready;
    data['isFavourite'] = this.isFavourite;
    return data;
  }
}

// Our demo Products
int qty=0;
List<Product> Shop1 = [
];

List<Product> Shop2 = [
/*
  Product(
    id: 2,
    images: [
      "assets/images/store2/2.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "ผ้าบาติก",
    price: 1500,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/store2/3.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "ผ้าบาติก",
    price: 990,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/store2/4.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "ผ้าบาติก",
    price: 2990,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
  Product(
    id: 5,
    images: [
      "assets/images/store2/5.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "ผ้าบาติก",
    price: 2990,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
  Product(
    id: 6,
    images: [
      "assets/images/store2/6.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "ผ้าบาติก",
    price: 2990,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
  Product(
    id: 7,
    images: [
      "assets/images/store2/7.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "ผ้าบาติก",
    price: 2990,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
  Product(
    id: 8,
    images: [
      "assets/images/store2/8.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "ผ้าบาติก",
    price: 2990,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),*/

];

List<Product> Shop3 = [
/*
  Product(
    id: 2,
    images: [
      "assets/images/store3/1.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "ผ้าบาติก",
    price: 1500,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/store3/2.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "ผ้าบาติก",
    price: 990,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/store3/3.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "ผ้าบาติก",
    price: 2990,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 5,
    images: [
      "assets/images/store3/4.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "ผ้าบาติก",
    price: 2990,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),

  Product(
    id: 7,
    images: [
      "assets/images/store3/5.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "ผ้าบาติก",
    price: 2990,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 6,
    images: [
      "assets/images/store3/5.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "ผ้าบาติก",
    price: 2990,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 7,
    images: [
      "assets/images/store3/6.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "ผ้าบาติก",
    price: 2990,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 8,
    images: [
      "assets/images/store3/7.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "ผ้าบาติก",
    price: 2990,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),*/
];


List<Product> Shop4 = [
  /*
  Product(
    id: 1,
    images: [
      "assets/images/store4/1.jpg",
      "assets/images/store4/2.jpg",
      "assets/images/store4/3.jpg",
      "assets/images/store4/4.jpg",
      "assets/images/store4/5.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "ผ้าบาติก",
    price: 2000,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/store4/1.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "ผ้าบาติก",
    price: 1500,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/store4/2.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "ผ้าบาติก",
    price: 990,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/store4/3.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "ผ้าบาติก",
    price: 2990,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 5,
    images: [
      "assets/images/store4/4.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "ผ้าบาติก",
    price: 2990,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 6,
    images: [
      "assets/images/store4/5.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "ผ้าบาติก",
    price: 2990,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),

 */
];

const String description =
    "ผ้าบาติก หรือเรียกอีกอย่างว่า ผ้าปาเต๊ะ เป็นคำที่ใช้เรียกผ้าชนิดหนึ่งที่มีวิธีการทำโดยใช้เทียนปิดส่วนที่ไม่ต้องการให้ติดสี และใช้วิธีการแต้ม ระบาย หรือย้อมในส่วนที่ต้องการให้ติดสีเท่านั้น ผ้าบาติกบางชิ้นอาจจะผ่านขั้นตอนการปิดเทียน แต้มสี ระบายสีและย้อมสีนับเป็นสิบๆ ครั้ง ส่วนผ้าบาติกอย่างง่ายอาจทำโดยการเขียนเทียนหรือพิมพ์เทียนแล้วจึงนำไปย้อมสีที่ต้องการ เมื่อย้อนกลับไปคำว่าบาติก {Batik} หรือปาเต๊ะ เดิมเป็นคำในภาษาชวาที่ใช้เรียกผ้าที่มีลวดลายที่เป็นจุด คำ ว่า “ ติก”  มีความหมายว่า เล็กน้อย หรือจุดเล็กๆมีความหมายเช่นเดียวกับคำว่า ตริติก หรือ ตาริติก ดังนั้นคำว่า บาติก จึงมีความหมายว่าเป็นผ้าที่มีลวดลายเป็นจุดๆ";
