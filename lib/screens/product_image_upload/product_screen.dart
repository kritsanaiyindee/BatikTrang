import 'package:flutter/material.dart';


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
    );
  }
}
