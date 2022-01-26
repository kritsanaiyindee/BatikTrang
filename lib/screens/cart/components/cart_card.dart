import 'package:flutter/material.dart';
import 'package:batiktrang/models/Cart.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../cart_screen.dart';
class CartCard extends StatefulWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;
  @override
  _CartCardState createState() => _CartCardState();
}
//class CartCard extends StatelessWidget {
  class _CartCardState extends State<CartCard> {
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        SizedBox(
          width: 150,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child:Image.network('${weburi}${this.widget.cart.product.imageUrl}',fit:BoxFit.fill,),
             // child: Image.asset(this.widget.cart.product.images[0]),
            ),
          ),
        ),
        SizedBox(width: 10),

        Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              this.widget.cart.product.name!,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),

            Text.rich(
              TextSpan(
               // text: "\฿${this.widget.cart.product.price}",
                text: "\฿${NumberFormat("#,###").format(double.tryParse(this.widget.cart.product.price!)) }",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                children: [
                  TextSpan(
                      text: " x${this.widget.cart.numOfItem}",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            )


          ],
        ),
        SizedBox(
          width: 20,

        ),

        Column(
            mainAxisAlignment: MainAxisAlignment.end,
        children: [
            GestureDetector(
        onTap: () {
          print('xxxxxx');
          setState(() {
            RemoveFromCart(this.widget.cart);
            demoCarts.remove(this.widget.cart);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => CartScreen()));
            //Navigator.pushNamed(context, CartScreen.routeName);
          });
        },
          child:SvgPicture.asset("assets/icons/Trash.svg"),
        )
        ])


      ],
    );
  }
}
