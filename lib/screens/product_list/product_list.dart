import 'package:batiktrang/components/coustom_bottom_nav_bar.dart';
import 'package:batiktrang/enums.dart';
import 'package:batiktrang/screens/product_list/product_scoped_model.dart';
import 'package:batiktrang/screens/product_list/product_list_item.dart';
import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';
import 'package:batiktrang/components/product_card.dart';

class ProductsListScreen extends StatelessWidget {
  const ProductsListScreen({
    Key? key,
    this.shop,
  }) : super(key: key);
  final int? shop;
  static String routeName = "/ProductsList";

  @override
  Widget build(BuildContext context) {
    ProductScopedModel productModel = ProductScopedModel();
    productModel.parseProductsFromResponse(shop!, 1);

    return new ScopedModel<ProductScopedModel>(
      model: productModel,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "รายการสินค้า",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: ProductsListPageBody(
          shop: shop!,
        ),
        bottomNavigationBar:
            CustomBottomNavBar(selectedMenu: MenuState.message),
      ),
    );
  }
}

class ProductsListPageBody extends StatelessWidget {
  final int shop;

  ProductsListPageBody({
    required this.shop,
  });

  BuildContext? context;
  ProductScopedModel? model;

  int pageIndex = 1;

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return ScopedModelDescendant<ProductScopedModel>(
      builder: (context, child, model) {
        this.model = model;
        return model.isLoading
            ? _buildCircularProgressIndicator()
            : _buildListView();
      },
    );
  }

  _buildCircularProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _buildListView() {
    Size screenSize = MediaQuery.of(context!).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: model!.getProductsCount() == 0
          ? Center(child: Text("No products available."))
          : ListView.builder(
              itemCount: (model!.getProductsCount() + 2),
              itemBuilder: (context, index) {
                // print('xxxxxxxxxxxxxxxxxxxxxxxxxx${index}');

                if (index == model!.getProductsCount()+1) {
                  print('xxxxxxxxxxxxxxxxxxxxxxxxxx${index}');
                  if (model!.hasMoreProducts) {
                    //pageIndex++;
                    //model!.parseProductsFromResponse(this.shop, pageIndex);
                    return Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  return Container();
                } else if (index == 0) {
                  //0th index would contain filter icons
                  // return _buildFilterWidgets(screenSize);
                  return Container();
                } else if (index % 2 == 0) {
                  //2nd, 4th, 6th.. index would contain nothing since this would
                  //be handled by the odd indexes where the row contains 2 items
                  return Container();
                } else {
                  //1st, 3rd, 5th.. index would contain a row containing 2 products
                  ;
                  print('   ${index}');

                  print('   ${model!.getProductsCount()}');
                  print(
                      ' index > model!.getProductsCount()   ${index > model!.getProductsCount()}');
                  if (index > model!.getProductsCount()) {
                    return Container();
                  }
                  print(' xxxxx  ${index-1}');
                  print(' xxxxxxx  ${index}');
                  if(index==model!.getProductsCount()){
                    return ProductsListItem(
                      //product:model!.productsList[index]);
                      product1: model!.productsList[index - 1],
                      product2: null,
                    );
                  }else{
                    return ProductsListItem(
                      //product:model!.productsList[index]);
                      product1: model!.productsList[index - 1],
                      product2: model!.productsList[index],
                    );
                  }

                }
              },
            ),
    );
  }

  _buildFilterWidgets(Size screenSize) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      width: screenSize.width,
      child: Card(
        elevation: 4.0,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildFilterButton("SORT"),
              Container(
                color: Colors.black,
                width: 2.0,
                height: 12.0,
              ),
              _buildFilterButton("REFINE"),
            ],
          ),
        ),
      ),
    );
  }

  _buildFilterButton(String title) {
    return InkWell(
      onTap: () {
        print(title);
      },
      child: Row(
        children: <Widget>[
          Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          SizedBox(
            width: 2.0,
          ),
          Text(title),
        ],
      ),
    );
  }
}
