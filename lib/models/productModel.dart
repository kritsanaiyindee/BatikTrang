class ProductModel {
  String? id;
  String? shopId;
  String? name;
  String? description;
  String? code;
  String? imageUrl;
  String? price;
  String? rating;
  String? isready;

  ProductModel(
      {this.id,
        this.shopId,
        this.name,
        this.description,
        this.code,
        this.imageUrl,
        this.price,
        this.rating,
        this.isready});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shop_id'];
    name = json['name'];
    description = json['description'];
    code = json['code'];
    imageUrl = json['image_url'];
    price = json['price'];
    rating = json['rating'];
    isready = json['isready'];
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
    return data;
  }
}