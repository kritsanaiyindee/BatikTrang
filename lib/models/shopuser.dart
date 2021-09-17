import 'package:batiktrang/models/any_image.dart';

class ShopUser {
  String? id;
  String? shopId;
  String? firstName;
  String? middleName;
  String? lastName;
  String? mobile;
  String? email;
  String? passwordHash;
  String? admin;
  String? vendor;
  String? registeredAt;
  String? lastLogin;
  String? intro;
  String? profile;

  ShopUser(
      { this.id,
         this.shopId,
         this.firstName,
         this.middleName,
         this.lastName,
         this.mobile,
         this.email,
         this.passwordHash,
         this.admin,
         this.vendor,
         this.registeredAt,
         this.lastLogin,
         this.intro,
         this.profile});

  ShopUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shop_id'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    mobile = json['mobile'];
    email = json['email'];
    passwordHash = json['passwordHash'];
    admin = json['admin'];
    vendor = json['vendor'];
    registeredAt = json['registeredAt'];
    lastLogin = json['lastLogin'];
    intro = json['intro'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shop_id'] = this.shopId;
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['passwordHash'] = this.passwordHash;
    data['admin'] = this.admin;
    data['vendor'] = this.vendor;
    data['registeredAt'] = this.registeredAt;
    data['lastLogin'] = this.lastLogin;
    data['intro'] = this.intro;
    data['profile'] = this.profile;
    return data;
  }
}


ShopUser  usr= new ShopUser();