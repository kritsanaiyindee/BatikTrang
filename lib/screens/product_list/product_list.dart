import 'package:batiktrang/components/coustom_bottom_nav_bar.dart';
import 'package:batiktrang/enums.dart';
import 'package:batiktrang/models/Cart.dart';
import 'package:batiktrang/models/shopuser.dart';
import 'package:batiktrang/screens/before_sign_in/sign_in_screen.dart';
import 'package:batiktrang/screens/cart/cart_screen.dart';
import 'package:batiktrang/screens/home/components/icon_btn_with_counter.dart';
import 'package:batiktrang/screens/home/components/shop_location.dart';
import 'package:batiktrang/screens/product_list/product_list_item1.dart';
import 'package:batiktrang/screens/product_list/product_scoped_model.dart';
import 'package:batiktrang/screens/product_list/product_list_item.dart';
import 'package:batiktrang/screens/profile/components/location4.dart';
import 'package:batiktrang/screens/profile/profile_screen.dart';
import 'package:batiktrang/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:scoped_model/scoped_model.dart';
import 'package:batiktrang/components/product_card.dart';

import '../../constants.dart';
import '../../size_config.dart';

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
        floatingActionButton: FloatingActionButton(
          onPressed:(){
            print('xxxxxxxxxxxxxxxxxxxxxxxx${usr.email}');
            if(usr.email!=null){
              Navigator.pushNamed(context, ProfileScreen.routeName);
            }else{
              Navigator.pushNamed(context, BeforeSignInScreen.routeName);
            }
          },
/*
          onPressed: () {
            if(usr.email!=null){
              Navigator.pushNamed(context, CartScreen.routeName);
            }else{
              Navigator.pushNamed(context, SignInScreen.routeName);
            }

          },

 */
          child: IconBtnWithCounter(
            numOfitem: demoCarts.length,
            svgSrc: "assets/icons/CartIcon.svg",
            press:(){

            }
            ,
            //press: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
          backgroundColor: Colors.green,

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
    //  const LatLng _Praya = LatLng(7.806820621462803, 99.5640122288329);
    //  const LatLng _PJ = LatLng(7.7180347299396885, 99.67597380933788);
    //  const LatLng _tm = LatLng(7.443838181759113, 99.54926246523647);
    //  const LatLng _choke = LatLng(7.575327728724853, 99.61740267202796);
    const LatLng _Praya = LatLng(7.806820621462803, 99.5640122288329);
    const LatLng _PJ = LatLng(7.7180347299396885, 99.67597380933788);
    const LatLng _tm = LatLng(7.443838181759113, 99.54926246523647);
    const LatLng _choke = LatLng(7.575327728724853, 99.61740267202796);
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Locationpoint.svg", "text": "โชคกมลรัตน์ผ้าบาติก","shop":"/shop1","loc":"โชคกมลรัตน์บาติก 119/226 ถ.รักษ์จันทร์ หมู่ 5. นาตาล่วง เมือง. ตรัง 92000"
        ,"lat":7.575327728724853,"lng":99.61740267202796,"LatLng":_choke},
      {"icon": "assets/icons/Locationpoint.svg", "text": "โต๊ะเมืองบาติก","shop":"/shop2","loc":"กลุ่มโต๊ะเมืองบาติก ต.บางหมาก อ.กันตัง จ.ตรัง 92110"
        ,"lat":7.443838181759113,"lng":99.54926246523647,"LatLng":_tm},
      {"icon": "assets/icons/Locationpoint.svg", "text": "พญาบาติก","shop":"/shop3","loc":"พญาบาติก(phaya​ batik)​ 69​ หมู่​ 7​ เขา​กอบ​ ห้วยยอด​ Trang 92130 "
        ,"lat":7.806820621462803,"lng":99.5640122288329,"LatLng":_Praya},
      {"icon": "assets/icons/Locationpoint.svg", "text": "พีเจบาติก","shop":"/shop4","loc":"PJบาติก 4123 ตำบลปากแจ่ม, ห้วยยอด, จังหวัดตรัง 92190"
        ,"lat":7.7180347299396885,"lng":99.67597380933788,"LatLng":_PJ},

    ];
    return ScopedModelDescendant<ProductScopedModel>(
      builder: (context, child, model)
    {
      this.model = model;
      return model.isLoading
          ? _buildCircularProgressIndicator()
          :
      Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child:  SafeArea(
            //  padding: const EdgeInsets.only(bottom: 8.0),
            child:
            SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        decoration: BoxDecoration(
                          border: Border(
                            //top: BorderSide(width: 1.0, color: Colors.lightBlue.shade600),
                            //bottom: BorderSide(width: 1.0, color: Colors.lightBlue.shade900),
                          ),
                          color: Colors.white,


                        ),
                        width: 400.0,
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              categories[this.shop-1]["text"],
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: logoColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32.0),
                            ),
                          ],
                        ),
                      ),
                      new Container(
                        decoration: BoxDecoration(
                          border: Border(
                            // top: BorderSide(width: 1.0, color: Colors.lightBlue.shade600),
                            //   bottom: BorderSide(width: 1.0, color: Colors.lightBlue.shade900),
                          ),
                          color: Colors.white,
                        ),
                        width: 400.0,
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              "รายละเอียดร้านค้า",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: logoColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          ],
                        ),
                      ),


                      ...model.productsList.map((item) {
                        return ProductsListItem1(
                          //product:model!.productsList[index]);
                          product1: item,
                        );
                      }).toList(),
                    ]
                )
            )
          )
      )


      ;

    });
  }




              /*    children: [//myList,
                ProductsListItem1(
                //product:model!.productsList[index]);
                product1: model.productsList[1],
                )
              ,ProductsListItem1(
        //product:model!.productsList[index]);
        product1: model.productsList[2],
        ),

                    GridView.count(

                      primary: false,
                      shrinkWrap: true,
                      crossAxisCount: 1,
                      crossAxisSpacing: 0.0,
                      mainAxisSpacing: 0.0,
                    padding:  EdgeInsets.all(0),
                      children: List.generate(model.getProductsCount(), (index) {
                        return
                           ProductsListItem1(
                          //product:model!.productsList[index]);
                          product1: model.productsList[index],
                        );

                      }),



                    ),
                    //   )


                    //   SizedBox(height: getProportionateScreenWidth(10)),
                    //ShopLocations(),
                    // SpecialOffers(),
                    //    SizedBox(height: getProportionateScreenWidth(30)),
                    //   PopularProducts(),
                    //     SizedBox(height: getProportionateScreenWidth(30)),
                  ],
                ),
              )*/


      //  ;
     // },
   // );
 // }

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
              itemCount: (model!.getProductsCount()),
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
