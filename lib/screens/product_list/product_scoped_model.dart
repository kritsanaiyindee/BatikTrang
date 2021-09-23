import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'package:batiktrang/models/Product.dart';
import 'package:batiktrang/models/shopcategory.dart';

class ProductScopedModel extends Model {
  List<Product> _productsList= [];
  bool _isLoading = true;
  bool _hasModeProducts = true;
  int currentProductCount=0;

  List<Product> get productsList => _productsList;

  bool get isLoading => _isLoading;

  bool get hasMoreProducts => _hasModeProducts;

  void addToProductsList(Product product) {
    _productsList.add(product);
  }

  int getProductsCount() {
    return _productsList.length;
  }

  Future<dynamic> _getProductsByCategory(categoryId, pageIndex) async {


    return json.decode("{}");
  }
  Future parseProductsFromResponse(int shopid, int pageIndex) async {
    _productsList= [];
    //print('xxxxx${_productsList.length}');
    if (pageIndex == 1) {
      _isLoading = true;
    }

    notifyListeners();

    currentProductCount = 0;
    print('shopid   ===========${shopid}');
    var shp=Shop1;
    if(shopid==1){
      shp=Shop1.where((i) => i.shopId=="1").toList();;
    }else if(shopid==2){
      shp=Shop1.where((i) => i.shopId=="2").toList();;
    }else if(shopid==3){
      shp=Shop1.where((i) => i.shopId=="3").toList();;
    }else if(shopid==4){
      shp=Shop1.where((i) => i.shopId=="4").toList();;
    }else{
      shp=Shop1;
    }
    //var dataFromResponse = await _getProductsByCategory(categoryId, pageIndex);

    shp.forEach(
          (newProduct) {
        currentProductCount++;
        print('currentProductCount${currentProductCount}');     //parse the product's images
       //parse the product's categories
        addToProductsList(newProduct);
      },
    );
    /*
    Shop2.forEach(
          (newProduct) {
        currentProductCount++;
        print('currentProductCount${currentProductCount}');     //parse the product's images
        //parse the product's categories
        addToProductsList(newProduct);
      },
    );

    Shop3.forEach(
          (newProduct) {
        currentProductCount++;
        print('currentProductCount${currentProductCount}');     //parse the product's images
        //parse the product's categories
        addToProductsList(newProduct);
      },
    );

    Shop4.forEach(
          (newProduct) {
        currentProductCount++;
        print('currentProductCount${currentProductCount}');     //parse the product's images
        //parse the product's categories
        addToProductsList(newProduct);
      },
    );

     */

    List<ShopCategory> categoriesOfProductList = [];


    categoriesOfProductList.add(
        new ShopCategory(
          id: 1,
          name:"โชคกมลรัตน์ผ้าบาติก",
        )
    );
    categoriesOfProductList.add(
        new ShopCategory(
          id: 1,
          name:"โต๊ะเมืองบาติก",
        )
    );
    categoriesOfProductList.add(
        new ShopCategory(
          id: 1,
          name:"พญาบาติก",
        )
    );
    categoriesOfProductList.add(
        new ShopCategory(
          id: 1,
          name:"พีเจบาติก",
        )
    );

    if (pageIndex == 1) _isLoading = false;

    if (currentProductCount < 6) {
      _hasModeProducts = false;
    }
    _hasModeProducts = false;
    notifyListeners();
  }
/*
  Future parseProductsFromResponse(int categoryId, int pageIndex) async {

  }

 */
}
