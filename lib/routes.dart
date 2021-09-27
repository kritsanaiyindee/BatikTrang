import 'package:batiktrang/screens/order_detail/order_detail.dart';
import 'package:batiktrang/screens/order_list/order_list.dart';
import 'package:batiktrang/screens/product_image_upload/product_screen.dart';
import 'package:batiktrang/screens/product_list/product_list.dart';
import 'package:batiktrang/screens/shop_buy_list/shop_buy_list.dart';
import 'package:flutter/widgets.dart';
import 'package:batiktrang/screens/cart/cart_screen.dart';
import 'package:batiktrang/screens/complete_profile/complete_profile_screen.dart';
import 'package:batiktrang/screens/details/details_screen.dart';
import 'package:batiktrang/screens/forgot_password/forgot_password_screen.dart';
import 'package:batiktrang/screens/home/home_screen.dart';
import 'package:batiktrang/screens/login_success/login_success_screen.dart';
import 'package:batiktrang/screens/otp/otp_screen.dart';
import 'package:batiktrang/screens/profile/profile_screen.dart';
import 'package:batiktrang/screens/sign_in/sign_in_screen.dart';
import 'package:batiktrang/screens/splash/splash_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';
import 'screens/sign_up_sellers//sign_up_screen.dart';
// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  "/shop1": (context) => ProductsListScreen(shop:1),
  "/shop2": (context) => ProductsListScreen(shop:2),
  "/shop3": (context) => ProductsListScreen(shop:3),
  "/shop4": (context) => ProductsListScreen(shop:4),
  "/ProductsList": (context) => ProductsListScreen(shop:1),
   UploadProductScreen.routeName: (context) => UploadProductScreen(),
  OrderListScreen.routeName: (context) => OrderListScreen(),
  OrderDetailScreen.routeName: (context) => OrderDetailScreen(),
  ShopBuyListScreen.routeName: (context) => ShopBuyListScreen(),
  SignUpSellerScreen.routeName: (context) => SignUpSellerScreen(),


};
