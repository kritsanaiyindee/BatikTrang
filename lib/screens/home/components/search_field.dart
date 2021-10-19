import 'package:batiktrang/screens/product_list/product_list_search.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SearchField extends StatefulWidget  {
  const SearchField({
    Key? key,
  }) : super(key: key);
  @override
  _MyCustomFormState createState() => _MyCustomFormState();

}
  class _MyCustomFormState extends State<SearchField> {


    final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: myController,
        onChanged: (value) => print(value),
        onSubmitted: (v){

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ( _) =>
                      ProductsListSearchScreen(textSearch:v,shop:1)));

        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "ค้นหาสินค้า",
            prefixIcon:
            IconButton(
              onPressed:() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ( _) =>
                            ProductsListSearchScreen(textSearch:myController.text,shop:1)));

              },
              icon: Icon(Icons.search),
            ),
        ),
      ),
    );
  }
}
