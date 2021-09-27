class ORder {
  String? id;
  String? userId;
  String? totalBuy;
  String? totalItem;
  String? createat;
  String? status;
  ORder(
      {this.id, this.userId, this.totalBuy, this.totalItem, this.createat,this.status});

  ORder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    totalBuy = json['total_buy'];
    totalItem = json['total_item'];
    createat = json['createat'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['total_buy'] = this.totalBuy;
    data['total_item'] = this.totalItem;
    data['createat'] = this.createat;
    data['status'] = this.status;
    return data;
  }
}
List<ORder> order = [];
double OrderTotalValue=0;
String OrderStatus="สั่งซื้อ";