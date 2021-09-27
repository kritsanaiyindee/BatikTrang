import 'package:batiktrang/models/Order.dart';
import 'package:batiktrang/models/Product.dart';
import 'package:batiktrang/models/shopuser.dart';
import 'package:batiktrang/screens/order_detail/order_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:batiktrang/models/Cart.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'order_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //late Future myFuture;
  List<ORder> ord = [];

  Future<List<ORder>> getMaster() async {
    var data = {"user_id": "${usr.id}"};
    var url = Uri.parse('${weburi}/load_order.php');
    var responsep = await http.post(url, body: json.encode(data));
    print('ddddddd ---- ${responsep.body}---');
    // Getting Server response into variable.
    var messagep = jsonDecode(responsep.body);
    //setState(() {
    ord = List<ORder>.from(messagep.map((model) => ORder.fromJson(model)));
    print('${messagep}');
    print('bbbbbbbbbbbbbbbbb${ord.length}');

    return ord;
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: FutureBuilder(
        future: getMaster(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: ord.length,
              itemBuilder: (context, position) {
                return new GestureDetector(
                    //You need to make my child interactive

                    onTap: ()  {
                      setState(() {
                        OrderTotalValue=double.tryParse('${ord[position].totalBuy}')!;
                        order.clear();
                        order.add(ord[position]);
                      });



                          Navigator.pushNamed(
                              context, OrderDetailScreen.routeName);
                          //print(ord[position].id),
                        },
                    child: OrderCard(
                      order: ord[position],
                    ));
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
