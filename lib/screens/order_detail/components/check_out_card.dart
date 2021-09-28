import 'package:batiktrang/models/Cart.dart';
import 'package:batiktrang/models/Order.dart';
import 'package:batiktrang/models/OrderItem.dart';
import 'package:batiktrang/models/shopuser.dart';
import 'package:batiktrang/screens/home/home_screen.dart';
import 'package:flutter/gestures.dart';
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
  double total=0;
  int canJoin =int.parse('${order[0].status}');
  @override
  void initState() {
    super.initState();

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
  showLoaderDialogStatus(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text("อัพเดตสถานะ..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }
  Future _showDialog(context) async {
    return await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Expanded(
                  child: SizedBox(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          if(!isOrderTail)Row(
                            children: [
                              Radio(
                                value: 1,
                                groupValue: canJoin,
                                onChanged: (value) {
                                  setState(() {
                                    canJoin = int.parse('${value}');
                                    GlobalFunction.getStatusText(canJoin);
                                  });
                                },
                              ),
                              Text("ส่งของ", style: TextStyle(fontSize: 18)),
                            ],
                          ),
                          if(!isOrderTail)Row(
                            children: [
                              Radio(
                                value: 2,
                                groupValue: canJoin,
                                onChanged: (value) {
                                  setState(() {
                                    canJoin = int.parse('${value}');
                                    GlobalFunction.getStatusText(canJoin);
                                  });
                                },
                              ),
                              Text("รอจัดของ", style: TextStyle(fontSize: 18)),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 3,
                                groupValue: canJoin,
                                onChanged: (value) {
                                  setState(() {

                                    canJoin = int.parse('${value}');
                                    GlobalFunction.getStatusText(canJoin);
                                  });
                                },
                              ),
                              Text("ยกเลิก", style: TextStyle(fontSize: 18)),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 4,
                                groupValue: canJoin,
                                onChanged: (value) {
                                  setState(() {

                                    canJoin = int.parse('${value}');
                                    GlobalFunction.getStatusText(canJoin);
                                  });
                                },
                              ),
                              Text("รับของแล้ว", style: TextStyle(fontSize: 18)),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 5,
                                groupValue: canJoin,
                                onChanged: (value) {
                                  setState(() {

                                    canJoin = int.parse('${value}');
                                    GlobalFunction.getStatusText(canJoin);
                                  });
                                },
                              ),
                              Text("เสร็จสิ้น", style: TextStyle(fontSize: 18)),
                            ],
                          ),
                          DefaultButton(
                            text: "อัพเดตสถานะ",
                            press: () {
                              showLoaderDialogStatus(context);
                              _UpdateStatus();

                              //_createOrder();

                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //your code dropdown button here
              ]);
            },
          ),
        );
      },
    );
  }
//class CheckoutCard extends StatelessWidget {
  _UpdateStatus() async {
    // SERVER API URL

    print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
    Uri url=Uri.parse('${weburi}/update_order_status.php');
    var data = {
      'order_id':'${order[0].id}',
      'status': '${canJoin}',
    };
    //print('xxxxxxxxxxxxxx${widget.prd}xxxxxxxxxxxxxxxxxxxxxxxx');
    print('post date  ${data}');
    setState(() {
      GlobalFunction.getStatusText(canJoin);
    });
    //print('ddddddd  ${json.encode(data)}');

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));
    // print('ddddddd  ${response.body}');
    // Getting Server response into variable.
    var orderid = jsonDecode(response.body);

    Navigator.pushNamed(context, HomeScreen.routeName);
  }



  @override
  Widget build(BuildContext context) {

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
                        text: "\฿${OrderTotalValue}",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: "สถานะ:\n",
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('xxxxxxxxxxxxxx');
                            _showDialog(context);
                          },
                        text: "${order[0].statusText!}",
                        style: TextStyle(fontSize: 16, color: Colors.greenAccent),
                      ),
                    ],
                  ),
                ),
                if(demoCarts.length>0)SizedBox(
                  width: getProportionateScreenWidth(90),
                  child: DefaultButton(
                    text: "สั้งซ์้อ",
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
}
