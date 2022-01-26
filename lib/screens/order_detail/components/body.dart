import 'package:batiktrang/components/default_button.dart';
import 'package:batiktrang/models/Order.dart';
import 'package:batiktrang/models/OrderItem.dart';
import 'package:batiktrang/models/Product.dart';
import 'package:batiktrang/models/shopuser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:batiktrang/models/Cart.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'cart_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //late Future myFuture;
  List<OrderItem> ordItem = [];
  double odtotal=0;
  Future<List<OrderItem>> getMaster() async {
    var data = {"order_id": "${order[0].id}"};
    print('ddddddd ---- ${data}---');
    var url = Uri.parse('${weburi}/load_order_item.php');
    var responsep = await http.post(url, body: json.encode(data));
    print('ddddddd ---- ${responsep.body}---');
    // Getting Server response into variable.
    var messagep = jsonDecode(responsep.body);
    //setState(() {
    ordItem = List<OrderItem>.from(
        messagep.map((model) => OrderItem.fromJson(model)));
    print('${messagep}');
    orderItem = ordItem;
    print('bbbbbbbbbbbbbbbbb${ordItem.length}');
    //setState(() {
    //  orderItem=ordItem;
    // order.clear();
    //});
    odtotal = 0;
    orderItem.forEach((cart) {
      print('---orderItem-------${cart.qty}--${cart.priceBy}');
      odtotal += double.parse('${cart.qty}') * double.parse('${cart.priceBy}');
    });
    return ordItem;
    // });
  }

  Future<bool> RemoveFromCart(Cart p) async {
    var data = {"id": "${p.id}"};
    var url = Uri.parse('${weburi}/delete_cart.php');
    var responsep = await http.post(url, body: json.encode(data));
    print('ddddddd  ${responsep.body}');
    // Getting Server response into variable.
    var messagep = jsonDecode(responsep.body);
    print('${messagep}');
    return true;
    // });
  }
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
  Widget getCheckout(){
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
                        text: "\฿${odtotal}",
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
                      showLoaderDialog(context);
                      //_createOrder();

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
  @override
  Widget build(BuildContext context) {
    return



      Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: FutureBuilder(
        future: getMaster(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            print('<<<<<<<<<<<<<<<<${ordItem.length}');
            return

              ListView.builder(
              itemCount: ordItem.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),

                    child: CartCard(orderItem: ordItem[index]),

                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
