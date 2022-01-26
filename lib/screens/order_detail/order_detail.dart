import 'package:flutter/material.dart';
import 'package:batiktrang/models/Cart.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class OrderDetailScreen extends StatelessWidget {
  static String routeName = "/orderdetail";




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "รายละเอียดการสั่งซื้อ",
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
