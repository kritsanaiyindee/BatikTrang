import 'package:batiktrang/models/Cart.dart';
import 'package:batiktrang/models/shopuser.dart';
import 'package:batiktrang/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:batiktrang/components/default_button.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class CheckoutCard extends StatefulWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);
  @override
  _CheckoutCardState createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {


  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text("กำลังสั่งซื้อ..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

//class CheckoutCard extends StatelessWidget {
  _createOrder() async {
    // SERVER API URL

    print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
    Uri url=Uri.parse('${weburi}/create_order.php');


    //print('xxxxx2xxxxxxxxx${_uploadFileName}xxxxxxxxxxxxxxxxxxxxxxxx');
    //var img_url = "/shop${_value}/${_uploadFileName}";
    //print('xxxxxx3xxxxxxxx${widget.prd}xxxxxxxxxxxxxxxxxxxxxxxx');
    double total_buy=0;
    double total_item=0;
    demoCarts.forEach((cart) {
      total_buy+=cart.numOfItem*double.parse('${cart.product.price}')  ;
      total_item+=cart.numOfItem.toDouble();
    });
    var data = {
      'user_id':'${usr.id}',
      'shop_id':'${demoCarts[0].product.shopId}',
      'total_buy': '${total_buy}',
      'total_item': '${total_item}',
    };
    //print('xxxxxxxxxxxxxx${widget.prd}xxxxxxxxxxxxxxxxxxxxxxxx');
    print('post date  ${data}');
    //print('ddddddd  ${json.encode(data)}');

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));
    // print('ddddddd  ${response.body}');
    // Getting Server response into variable.
    var orderid = jsonDecode(response.body);
    print('return id  ${orderid}');
    url = Uri.parse('${weburi}/create_order_item.php');
    var messagep="false";
    demoCarts.forEach((cart)  async {
      var data_item = {
        'order_id':'${orderid}',
        'user_id':'${usr.id}',
        'product_id': '${cart.product.id}',
        'price_by': '${cart.product.price}',
        'qty': '${cart.numOfItem}',
      };
      print('post data_item  ${data_item}');
      var responsep = http.post(url, body: json.encode(data_item)).then((value) =>() {
      print('responsep  ${value.statusCode}');
          messagep = jsonDecode(value.body);
      print('ddddddd  ${value.body}');
    }
      );
      //    print('responsep  ${responsep.body}');
      //    messagep = jsonDecode(responsep.body);
      //    print('ddddddd  ${responsep.body}');

    });



    //var responsep = await http.post(url, body: json.encode(data));
    //print('ddddddd  ${responsep.body}');
    // Getting Server response into variable.
    //var messagep = jsonDecode(responsep.body);
    print('post messagep  ${messagep}');
    Navigator.pop(context);
    // If Web call Success than Hide the CircularProgressIndicator.
   // if (messagep == "true") {
      url = Uri.parse('${weburi}/delete_cart_all.php');
      var data_item = {
        'user_id':'${usr.id}',
      };
      print('post data_item  ${data_item}');
      var responsep = await http.post(url, body: json.encode(data_item));
      messagep = jsonDecode(responsep.body);
      print('clear cart  ${responsep.body}');


      demoCarts.clear();
      Navigator.pop(context);
      //  Navigator.pushNamed(context, HomeScreen.routeName);

   // } else {
      //  addError(error: kAlreadyHavethisUser);

   // }

    print('_signupClick  end');
  }



  @override
  Widget build(BuildContext context) {
    double total=0;
    demoCarts.forEach((cart) {
      total+=cart.numOfItem*double.parse('${cart.product.price}')  ;
    });
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Spacer(),
                Text("เก็บเงินปลายทาง"),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kTextColor,
                ),
                /*
                Text("ช่องทางการสั่งซื้อ"),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kTextColor,
                )

                 */
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "จำนวน:\n",
                    children: [
                      TextSpan(
                        text: "\฿${total}",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                if(demoCarts.length>0)SizedBox(
                  width: getProportionateScreenWidth(90),
                  child: DefaultButton(
                    text: "สั่งซื้อ",
                    press: () {
                      if(usr.email==null){
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      }else{
                        showLoaderDialog(context);
                        _createOrder();
                      }

                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
