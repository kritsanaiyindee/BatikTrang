import 'package:batiktrang/models/Order.dart';
import 'package:flutter/material.dart';
import 'package:batiktrang/models/Cart.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final ORder order;
  @override
  _CartCardState createState() => _CartCardState();
}




//class CartCard extends StatelessWidget {
  class _CartCardState extends State<OrderCard> {


  @override
  Widget build(BuildContext context) {
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
             // child:Image.network('${weburi}${this.widget.cart.product.imageUrl}',fit:BoxFit.fill,),
              child:new SvgPicture.asset('assets/icons/receipt.svg'),
              //child: Image.asset( "assets/icons/receipt.svg"),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order No.${this.widget.order.id!}',
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\฿${this.widget.order.totalBuy}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                children: [
                  TextSpan(
                      text: " ทั้งหมด ${this.widget.order.totalItem} รายการ",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                text: "สถานะ:",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                children: [
                  TextSpan(
                      text: "${GlobalFunction.getStatus(this.widget.order.status!)}",
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
