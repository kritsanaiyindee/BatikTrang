
import 'Product.dart';

class Cart {
  final Product product;
  final int numOfItem;
  String? id;
  Cart({required this.product, required this.numOfItem, this.id});
}
class CartUser {
  String? id;
  String? userId;
  String? productId;
  String? priceBy;
  String? qty;
  String? updateat;

  CartUser(
      {this.id,
        this.userId,
        this.productId,
        this.priceBy,
        this.qty,
        this.updateat});

  CartUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    priceBy = json['price_by'];
    qty = json['qty'];
    updateat = json['updateat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['price_by'] = this.priceBy;
    data['qty'] = this.qty;
    data['updateat'] = this.updateat;
    return data;
  }
}
// Demo data for our cart

List<Cart> demoCarts = [];


