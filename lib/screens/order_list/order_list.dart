import 'package:flutter/material.dart';
import 'package:batiktrang/models/Cart.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class OrderListScreen extends StatelessWidget {
  static String routeName = "/orderlist";




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      //bottomNavigationBar: CheckoutCard(),
    );
  }





  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "รายการสั่งซื้อ",
            style: TextStyle(color: Colors.black),
          ),
          /*
          Text(
            "${demoCarts.length} รายการ",
            style: Theme.of(context).textTheme.caption,
          ),

           */
        ],
      ),
    );
  }
}
