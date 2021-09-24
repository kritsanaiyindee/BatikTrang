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

  Future<List<Cart>> getMaster() async {
    var data = {"user_id":"${usr.id}" };
    var url = Uri.parse('${weburi}/load_cart.php');
    var responsep = await http.post(url, body: json.encode(data));
    print('ddddddd ---- ${responsep.body}---');
    if(responsep.body=="false"){
      demoCarts.clear();
      return demoCarts;
    }
    // Getting Server response into variable.
    var messagep = jsonDecode(responsep.body);
    //setState(() {
     var  cart = List<CartUser>.from(
          messagep.map((model) => CartUser.fromJson(model)));
    print('${messagep}');
    print('bbbbbbbbbbbbbbbbb${cart.length}');
    demoCarts.clear();
    cart.forEach((element) {
      var prd=Shop1.where((i) => i.id==element.productId).toList();;
      print('ffffffffffffffff${element.productId}');
      print('ddddddddddddd${prd.length}');
      print('ddddddddddddd${element.qty}');
      print('ddddddddddddd${int.tryParse('${element.qty!}')}');
      demoCarts.add(Cart(product: prd[0],id:element.id, numOfItem: int.tryParse('${element.qty}')! ));
    });
    print('${messagep}');
     return demoCarts;
   // });
  }

  Future<bool> RemoveFromCart(Cart p) async {
    var data = {"id":"${p.id}" };
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
      child:
      FutureBuilder(
        future: getMaster(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: demoCarts.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(demoCarts[index].product.id.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      RemoveFromCart(demoCarts[index]);
                      demoCarts.removeAt(index);

                    });
                  },
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        SvgPicture.asset("assets/icons/Trash.svg"),
                      ],
                    ),
                  ),
                  child: CartCard(cart: demoCarts[index]),
                ),
              ),
            );
          } else {
            return Center(
              //child: CircularProgressIndicator(),
            );
          }
        },
      ),










    );
  }
}
