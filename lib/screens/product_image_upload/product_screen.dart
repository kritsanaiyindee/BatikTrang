import 'package:batiktrang/components/coustom_bottom_nav_bar.dart';
import 'package:batiktrang/models/Product.dart';
import 'package:flutter/material.dart';


import '../../enums.dart';
import 'components/product_upload.dart';

class UploadProductScreen extends StatelessWidget {
  UploadProductScreen({Key? key, this.title, this.prd}) : super(key: key);

  final String? title;
  final Product? prd;

  static String routeName = "/upload_product";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Product"),
      ),
      body: UploadImageDemo(title: 'Image Picker Example',prd:prd),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }
}
