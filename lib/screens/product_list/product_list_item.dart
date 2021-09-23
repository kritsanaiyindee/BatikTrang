import 'package:batiktrang/components/default_button.dart';
import 'package:batiktrang/models/shopuser.dart';
import 'package:batiktrang/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:batiktrang/models/Product.dart';
import 'package:batiktrang/screens/details/details_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../constants.dart';
import '../../enums.dart';



class ProductsListItem extends StatelessWidget {
  final Product product1;
  final Product product2;

  ProductsListItem({
    required this.product1,
    required this.product2,
  });

  @override
  Widget build(BuildContext context) {
   // print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
   // print("xxxxxxxxxxxxxxxx${product1==null}xxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
  //  print("xxxxxxxxxxxxxxxx${product2==null}xxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildProductItemCard(context, product1),
        product2 == null
            ? Container()
            : _buildProductItemCard(context, product2),
      ],
    );
  }
  Widget WrapingTextDetail(String txt) {
    return new Container(
      width: 160.0,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            txt,
            textAlign: TextAlign.left,
            style: TextStyle(

                fontWeight: FontWeight.bold,
                fontSize: 12.0),
          ),
        ],
      ),
    );
  }

  _buildProductItemCard(BuildContext context, Product product) {
    return InkWell(
      onTap: () {
        qty=1;
        Navigator.pushNamed(
          context,
          DetailsScreen.routeName,
          arguments: ProductDetailsArguments(product: product),
        );
      },
      child: Card(
        elevation: 4.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              //child:Image.asset('${product.images[0]}'),
              child:Image.network('${weburi}${product.imageUrl}'),
              height: 160.0,
              width: MediaQuery.of(context).size.width / 2.2,
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  WrapingTextDetail(product.name!),
                 /* Text(
                    product.title,
                    style: TextStyle(fontSize: 16.0, color: Colors.grey),
                  ),

                  */
                  SizedBox(
                    height: 2.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "\฿${product.price}",
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),

                    ],
                  ),
                  if(usr.email!=null)Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: SvgPicture.asset(
                          "assets/icons/edit.svg",
                            color:  kPrimaryColor

                        ),
                        onPressed: () =>
                          //  Navigator.pushNamed(context, HomeScreen.routeName),
                        Fluttertoast.showToast(
                            msg: "แก้ไข Product รอทำ function",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: logoColor,
                            textColor: Colors.white,
                            fontSize: 16.0
                        )
                      ),
                      IconButton(
                        icon: SvgPicture.asset(
                          "assets/icons/Trash.svg",

                        ),
                        onPressed: () =>
                           // Navigator.pushNamed(context, HomeScreen.routeName),
                          Fluttertoast.showToast(
                              msg: "ลบ Product รอทำ function",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: logoColor,
                              textColor: Colors.white,
                              fontSize: 16.0
                          )
                      ),

                    ],
                  ),


                  SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}