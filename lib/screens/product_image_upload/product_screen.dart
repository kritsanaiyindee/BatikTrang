import 'package:batiktrang/components/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';


import '../../enums.dart';
import 'components/product_upload.dart';

class UploadProductScreen extends StatelessWidget {
  static String routeName = "/upload_product";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Product"),
      ),
      body: UploadImageDemo(title: 'Image Picker Example'),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }
}
