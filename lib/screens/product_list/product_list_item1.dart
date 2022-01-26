import 'package:batiktrang/components/default_button.dart';
import 'package:batiktrang/helper/keyboard.dart';
import 'package:batiktrang/models/shopuser.dart';
import 'package:batiktrang/screens/before_sign_in/sign_in_screen.dart';
import 'package:batiktrang/screens/home/home_screen.dart';
import 'package:batiktrang/screens/product_image_upload/components/product_upload.dart';
import 'package:batiktrang/screens/product_image_upload/product_screen.dart';
import 'package:batiktrang/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:batiktrang/models/Product.dart';
import 'package:batiktrang/screens/details/details_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';
import '../../enums.dart';



class ProductsListItem1 extends StatelessWidget {

/*
  ProductsListItem({
    this.product1,
    this.product2,
  });

 */
  const ProductsListItem1({
    Key? key,
    required this.product1,
  }) : super(key: key);
  //final String? text, image;
  final Product product1;



  @override
  Widget build(BuildContext context) {
   // print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
   // print("xxxxxxxxxxxxxxxx${product1==null}xxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
  //  print("xxxxxxxxxxxxxxxx${product2==null}xxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _buildProductItemCard(context, product1),
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
                fontSize: 17.0),
          ),
        ],
      ),
    );
  }

  _buildProductItemCard(BuildContext context, Product product) {
    return InkWell(
      onTap: () {
        qty=1;


        print('xxxxxxxxxxxxxxxxxxxxxxxx${usr.email}');
        if(usr.email!=null){
         // Navigator.pushNamed(context, ProfileScreen.routeName);
          Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: ProductDetailsArguments(product: product),
          );
        }else{

          Navigator.pushNamed(context, BeforeSignInScreen.routeName);
        }
      },
      child: Card(
        elevation: 1.0,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              //child:Image.asset('${product.images[0]}'),
              child:Image.network('${weburi}${product.imageUrl}',fit:BoxFit.fill),
              height: 100.0,
              width: 100,
            ),
            SizedBox(
              height: 28.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  WrapingTextDetail(product.name!),

                  SizedBox(
                    height: 2.0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "\฿${NumberFormat("#,###").format(double.tryParse(product.price!)) }",
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),

                    ],
                  ),
                  //if(usr.email!=null)
                  //if(usr.shopId==product.shopId)

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      IconButton(
                          icon: SvgPicture.asset(
                              "assets/icons/CartIcon.svg",
                              color:  kPrimaryColor

                          ),
                          onPressed: () async {
                            qty=1;
                            Navigator.pushNamed(
                              context,
                              DetailsScreen.routeName,
                              arguments: ProductDetailsArguments(product: product),
                            );
                          }
                        //  Navigator.pushNamed(context, HomeScreen.routeName),
                      ),
                    ],
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