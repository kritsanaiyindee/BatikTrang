import 'package:flutter/material.dart';
import 'package:batiktrang/size_config.dart';

const kPrimaryColor = Color(0xFFFF7643);
const logoColor = Color.fromRGBO(118, 109, 152, 1.0);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kTextColorWhite = Colors.white;
const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);
const weburi="http://batiktrang.psautocar.com";
//const weburi="https://batiktrang.000webhostapp.com";
const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "โปรดระบุอีเมล์";
const String kInvalidEmailError = "โปรดระบุให้ถูกต้อง";
const String kPassNullError = "โปรดระบุรหัสผ่าน";
const String kShortPassError = "รหัสผ่านสั้นเกินไป";
const String kMatchPassError = "รหัสผ่านไม่ตรงกัน";
const String kNamelNullError = "โปรดระบุชื่อ";
const String kPhoneNumberNullError = "โปรดระบุเบอร์โทรศัพท์";
const String kAddressNullError = "โปรดระบุที่อยู่";
const String kAlreadyHavethisUser = "มีการใช้ email ลงทะเบียนอยู่แล้ว";
const String kNotFoundUser = "ข้อมูลการ Login ไม่ถูก โปรดตรวจสอบ";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

class GlobalFunction {
  static void printGlobal(String message) {
    //if(!Url_config.bCRM)
    print("GlobalMessage  ${message}");
  }
  static String getStatusText(int StatusValue){
    var OrderStatus="";
    if(StatusValue==0){
      OrderStatus="สั่งซื้อ";
    }else if(StatusValue==1){
      OrderStatus="ส่งของ";
    }else if(StatusValue==2){
      OrderStatus="รอจัดของ";
    }else if(StatusValue==3){
      OrderStatus="ยกเลิก";
    }else if(StatusValue==4){
      OrderStatus="รับของแล้ว";
    }else if(StatusValue==5){
      OrderStatus="เสร็จสิ้น";
    }else{
      OrderStatus="สั่งซื้อ";
    }
    return OrderStatus;

  }
  static String getStatus(String StatusValue){

    var OrderStatus="";
    if(StatusValue=="0"){
      OrderStatus="สั่งซื้อ";
    }else if(StatusValue=="1"){
      OrderStatus="ส่งของ";
    }else if(StatusValue=="2"){
      OrderStatus="รอจัดของ";
    }else if(StatusValue=="3"){
      OrderStatus="ยกเลิก";
    }else if(StatusValue=="4"){
      OrderStatus="รับของแล้ว";
    }else if(StatusValue=="5"){
      OrderStatus="เสร็จสิ้น";
    }else{
      OrderStatus="สั่งซื้อ";
    }
    print("GlobalMessage StatusValue ${StatusValue}");
    print("GlobalMessage OrderStatus ${OrderStatus}");
    return OrderStatus;
  }
}
