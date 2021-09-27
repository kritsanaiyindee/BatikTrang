import 'package:batiktrang/models/shopuser.dart';
import 'package:flutter/material.dart';
import 'package:batiktrang/components/default_button.dart';
import 'package:batiktrang/models/Product.dart';
import 'package:batiktrang/size_config.dart';
import 'package:batiktrang/models/Cart.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../../constants.dart';
import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';
import 'dart:convert';
class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);


  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text("สั่งซื้อ..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

  _AddtoCart(BuildContext context,Product product,int qty) async {
    // SERVER API URL


    Uri
      url = Uri.parse('${weburi}/create_cart_item.php');
    print('${weburi}/create_cart_item.php');
    var data = {
      'user_id':'${usr.id}',
      'product_id': '${product.id}',
      'price_by': '${product.price}',
      'qty': '${qty}',
    };
    print('${data}');
    //demoCarts.add(Cart(product: product, numOfItem: qty));
    //print('ddddddd  ${data}');
    //print('ddddddd  ${json.encode(data)}');

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));
    // print('ddddddd  ${response.body}');
    // Getting Server response into variable.
    var message = jsonDecode(response.body);
    url = Uri.parse('${weburi}/load_product.php');
    var responsep = await http.post(url, body: json.encode(data));
     print('ddddddd  ${responsep.body}');
    // Getting Server response into variable.
    var messagep = jsonDecode(responsep.body);
    print('ddddddd  ${messagep}');
      demoCarts.add(Cart(product: product, numOfItem: qty));

    if (message == "true") {
      //  Navigator.pushNamed(context, HomeScreen.routeName);
      Navigator.pop(context);
      Navigator.pop(context);
    } else {
      //  addError(error: kAlreadyHavethisUser);

    }

    print('_signupClick  end');
  }

  bool CheckShop(Product p){
    bool isMatch=true;
    ///demoCarts.clear();
    demoCarts.forEach((element) {
      if (element.product.shopId != p.shopId) {
        print(' element.product.shopId  ${element.product.shopId}      ${p.shopId}');
        isMatch = false;
        return;
      }
    });



    return isMatch;
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    ColorDots(product: product),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "ลงตะกร้า",
                          press: () {
                            if (CheckShop(product)){
                              showLoaderDialog(context);
                              _AddtoCart(context,product,qty);
                            }else{

                              Fluttertoast.showToast(
                                  msg: "ไม่สามารถเลือกข้ามร้านค้าได้",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                              print('Not Match!');
                            }

                            // demoCarts.add(Cart(product: product, numOfItem: qty));

                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
