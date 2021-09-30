import 'package:batiktrang/models/shopuser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as Io;
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../constants.dart';

import 'package:intl/intl.dart';

class ProfilePic extends StatefulWidget {
  //ProfilePic({Key? key)} : super(key: key);
ProfilePic({Key? key }) : super(key: key);

  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {



/*
class ProfilePic extends StatelessWidget {
  ProfilePic({
    Key? key,
  }) : super(key: key);
  */



  List<XFile>? _imageFileList;

  //final List<XFile>? _imageFileList;
  String? base64Image;

  set _imageFile(XFile? value) {
    _imageFileList = value == null ? null : [value];
  }
  String img_url="";
  String image_path="";
  final ImagePicker _picker = ImagePicker();
  String formattedDate="";
  startUpload(XFile xx) async {
    final bytes = Io.File(xx.path).readAsBytesSync();
    base64Image = base64Encode(bytes);

    String fileName = xx.path.split('/').last;
    var string = "";
    var obj=fileName.split(".");
    //_uploadFileName = fileName;
     print('  ddddusrphoto/${usr.id}.${obj[1]}  ddddd');
    var uploadEndPoint = Uri.parse('${weburi}/image_upload.php');

    //print('<-----------${weburi}/image_upload.php-------------->');
    //print('<-----------${uploadEndPoint.path}-------------->');
    var datax = {"image": base64Image, "name": 'usrphoto/${usr.id}.${obj[1]}', "path": ""};
    var response = await http.post(uploadEndPoint, body: json.encode(datax));
    //img_url='${weburi}/usrphoto/${usr.id}.${obj[1]}';
    print(' ${img_url}');
    DateTime now = DateTime.now();
    formattedDate = DateFormat('yyyyMMddkkmmss').format(now);
    setState(() {
      //usr.profile=image_path;
      image_path='/usrphoto/${usr.id}.${obj[1]}';
      usr.profile=image_path;
      img_url='${weburi}/usrphoto/${usr.id}.${obj[1]}?v=${formattedDate}';
    });
    print(' ${img_url}');
  }
  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text("อัพโหลดรูป..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }
  void _onImageButtonPressed(ImageSource source,
      {BuildContext? context, bool isMultiImage = false}) async {
    try {

      final pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 200,
        maxHeight: 200,
        //imageQuality: 70,
      );
      // setState(() {

      print('<-----------${pickedFile!.path}-------------->');
      _imageFile = pickedFile;
      startUpload(pickedFile);

      Uri url=Uri.parse('${weburi}/update_user.php');
      //print('xxxxx2xxxxxxxxx${_uploadFileName}xxxxxxxxxxxxxxxxxxxxxxxx');
      //var img_url = "/shop${_value}/${_uploadFileName}";
      //print('xxxxxx3xxxxxxxx${widget.prd}xxxxxxxxxxxxxxxxxxxxxxxx');
      var data = {
        'user_id':'${usr.id}',
        'profile': '${image_path}',
      };
      //print('xxxxxxxxxxxxxx${widget.prd}xxxxxxxxxxxxxxxxxxxxxxxx');
      print('ddddddd  ${data}');      //print('ddddddd  ${json.encode(data)}');

      // Starting Web API Call.
      var response = await http.post(url, body: json.encode(data));
      Navigator.pop(context!);



      // });
    } catch (e) {
      Navigator.pop(context!);
      // setState(() {
      //   _pickImageError = e;
      //  });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('${weburi}${usr.profile}?v=${formattedDate}');
    DateTime now = DateTime.now();
    formattedDate = DateFormat('yyyyMMddkkmmss').format(now);
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          ((usr.profile == null
              ? CircleAvatar(
                  // backgroundImage: (_imageFileList == null)?AssetImage("assets/images/Profile Image.png"):NetworkImage('${_imageFileList![0].path}')
                  backgroundImage:
                      AssetImage("assets/images/Profile Image.png"))
              : CircleAvatar(
                  // backgroundImage: (_imageFileList == null)?AssetImage("assets/images/Profile Image.png"):NetworkImage('${_imageFileList![0].path}')
                  backgroundImage:
                  NetworkImage('${weburi}${usr.profile}?v=${formattedDate}')))),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                  primary: Colors.white,
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () {
                  //_imageFileList!.clear();
                  showLoaderDialog(context);
                  _onImageButtonPressed(ImageSource.gallery, context: context);
                },
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
