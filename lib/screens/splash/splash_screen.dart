import 'package:flutter/material.dart';
import 'package:batiktrang/screens/splash/components/body.dart';
import 'package:batiktrang/size_config.dart';

import '../../constants.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: logoColor,
      body: Body(),
    );
  }
}
