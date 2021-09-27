class OrderItem {
  String? id;
  String? orderId;
  String? userId;
  String? productId;
  String? priceBy;
  String? qty;
  String? updateat;

  OrderItem(
      {this.id,
        this.orderId,
        this.userId,
        this.productId,
        this.priceBy,
        this.qty,
        this.updateat});

  OrderItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    userId = json['user_id'];
    productId = json['product_id'];
    priceBy = json['price_by'];
    qty = json['qty'];
    updateat = json['updateat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['price_by'] = this.priceBy;
    data['qty'] = this.qty;
    data['updateat'] = this.updateat;
    return data;
  }
}
List<OrderItem> orderItem = [];