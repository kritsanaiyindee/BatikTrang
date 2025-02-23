import 'package:batiktrang/models/OrderItem.dart';
import 'package:batiktrang/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:batiktrang/models/Cart.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CartCard extends StatefulWidget {
  const CartCard({
    Key? key,
    required this.orderItem,
  }) : super(key: key);

  final OrderItem orderItem;
  @override
  _CartCardState createState() => _CartCardState();
}




//class CartCard extends StatelessWidget {
  class _CartCardState extends State<CartCard> {


  @override
  Widget build(BuildContext context) {

    //var shp=Shop1.where((i) => i.id==this.widget.orderItem.productId).toList();
    var shp=Shop1;
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child:Image.network('${weburi}${shp[0].imageUrl}',fit:BoxFit.fill,),
             // child: Image.asset(this.widget.cart.product.images[0]),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              //'xxxxxxs',
              '${shp[0].name!}',
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\฿${this.widget.orderItem.priceBy}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                children: [
                  TextSpan(
                      text: " x${this.widget.orderItem.qty}",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
