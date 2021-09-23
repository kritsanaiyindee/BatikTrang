// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:convert';

import 'dart:io' as Io;
import 'package:batiktrang/components/custom_surfix_icon.dart';
import 'package:batiktrang/components/default_button.dart';
import 'package:batiktrang/constants.dart';
import 'package:batiktrang/models/Product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

import '../../../size_config.dart';

class UploadImageDemo extends StatefulWidget {
  UploadImageDemo({Key? key, this.title, this.prd}) : super(key: key);

  final String? title;
  final Product? prd;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<UploadImageDemo> {
  List<XFile>? _imageFileList;

  set _imageFile(XFile? value) {
    _imageFileList = value == null ? null : [value];
  }

  dynamic _pickImageError;
  bool isVideo = false;
  bool _isLoading = false;
  VideoPlayerController? _controller;
  VideoPlayerController? _toBeDisposed;
  String? _retrieveDataError;
  String _uploadFileName = "";
  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();
  String img_url_temp="assets/images/dummy.png";
  //
  static final String uploadEndPoint =
      'http://localhost/flutter_test/upload_image.php';
  Future<Io.File>? file;
  String status = '';
  String? base64Image;
  Io.File? tmpFile;
  String errMessage = 'Error Uploading Image';
  int _value = 1;
  final productName = TextEditingController();
  final proDuctDescription = TextEditingController();
  final productPrice = TextEditingController();

  Future<void> _playVideo(XFile? file) async {
    if (file != null && mounted) {
      await _disposeVideoController();
      late VideoPlayerController controller;
      if (kIsWeb) {
        controller = VideoPlayerController.network(file.path);
      } else {
        controller = VideoPlayerController.file(Io.File(file.path));
      }
      _controller = controller;
      // In web, most browsers won't honor a programmatic call to .play
      // if the video has a sound track (and is not muted).
      // Mute the video so it auto-plays in web!
      // This is not needed if the call to .play is the result of user
      // interaction (clicking on a "play" button, for example).
      final double volume = kIsWeb ? 0.0 : 1.0;
      await controller.setVolume(volume);
      await controller.initialize();
      await controller.setLooping(true);
      await controller.play();
      setState(() {});
    }
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
      setState(() {
        print('<-----------${pickedFile!.path}-------------->');
        _imageFile = pickedFile;
        //startUpload(pickedFile);
        print('FloatingActionButton4');
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  @override
  void deactivate() {
    if (_controller != null) {
      _controller!.setVolume(0.0);
      _controller!.pause();
    }
    super.deactivate();
  }

  @override
  void dispose() {
    _disposeVideoController();
    maxWidthController.dispose();
    maxHeightController.dispose();
    qualityController.dispose();
    super.dispose();
  }

  Future<void> _disposeVideoController() async {
    if (_toBeDisposed != null) {
      await _toBeDisposed!.dispose();
    }
    _toBeDisposed = _controller;
    _controller = null;
  }

  void initState() {
    if(widget.prd!=null){
      productName.text=widget.prd!.name!;
      proDuctDescription.text=widget.prd!.description!;
      productPrice.text=widget.prd!.price!;
      img_url_temp=widget.prd!.imageUrl!;
    }
    super.initState();
  }

  Widget _previewVideo() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_controller == null) {
      return const Text(
        'You have not yet picked a video',
        textAlign: TextAlign.center,
      );
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AspectRatioVideo(_controller),
    );
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  startUpload(XFile xx) async {
    final bytes = Io.File(xx.path).readAsBytesSync();
    base64Image = base64Encode(bytes);

    // print(base64Image);
    print('<-----------Uploading Imag-------------->');
    setStatus('Uploading Image...');
    String fileName = xx.path.split('/').last;
    _uploadFileName = fileName;
    // print('<-----------${fileName}-------------->');
    upload(fileName);
  }

  upload(String fileName) {
    var uploadEndPoint = Uri.parse('${weburi}/image_upload.php');
    //print('<-----------${weburi}/image_upload.php-------------->');
    //print('<-----------${uploadEndPoint.path}-------------->');
    http.post(uploadEndPoint, body: {
      "image": base64Image,
      "name": 'shop${_value}//${fileName}',
      "path": "shop${_value}"
    }).then((result) {
      print(
          '<-------result.statusCode == 200----${result.statusCode == 200}-------------->');
      setStatus(result.statusCode == 200 ? result.body : errMessage);
    }).catchError((error) {
      print('<-------result.statusCode == 200----${error}-------------->');
      setStatus(error);
    });
  }

  Widget _previewImages() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }

    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(0)),
        child: SingleChildScrollView(
            child: Column(children: [
          ddlShop(),
          buildNameFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildDescriptionFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPriceFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          SizedBox(
            height: 115,
            width: 115,
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: [
                (_imageFileList != null)?
                  Image.file(
                  Io.File(_imageFileList![0].path),
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill,
                ):
                (widget.prd!=null)?Image.network('${weburi}${widget.prd!.imageUrl}',fit:BoxFit.fill):


                Image.asset(
              "${img_url_temp}",
              height: 200,
              width: 200,
            ),
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
                        print('FloatingActionButton');
                        isVideo = false;
                        _onImageButtonPressed(ImageSource.gallery,
                            context: context);
                      },
                      child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
              _isLoading ? CircularProgressIndicator():SizedBox(height: getProportionateScreenHeight(0)),
          DefaultButton(
            text: "บันทึก",
            press: () {
              setState(() {
                _isLoading = true;
              });
              _createProductClick();
              // Navigator.pushNamed(context, OtpScreen.routeName);
            },
          ),
        ])));
    /*
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    }

     */
  }

  Widget _handlePreview() {
    if (isVideo) {
      return _previewVideo();
    } else {
      return _previewImages();
    }
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      if (response.type == RetrieveType.video) {
        isVideo = true;
        await _playVideo(response.file);
      } else {
        isVideo = false;
        setState(() {
          startUpload(response.file!);
          // base64Image = base64Encode(response.file.readAsBytes());

          _imageFile = response.file;
          _imageFileList = response.files;
        });
      }
    } else {
      _retrieveDataError = response.exception!.code;
    }
  }

  Widget ddlShop() {
    return new DropdownButton(
        value: _value,
        items: [
          DropdownMenuItem(
            child: Text("โชคกมลรัตน์บาติก"),
            value: 1,
          ),
          DropdownMenuItem(
            child: Text("โต๊ะเมืองบาติก"),
            value: 2,
          ),
          DropdownMenuItem(
            child: Text("พญาบาติก"),
            value: 3,
          ),
          DropdownMenuItem(
            child: Text("พีเจบาติก"),
            value: 4,
          )
        ],
        onChanged: (newValue) {
          setState(() {
            _value = newValue as int;
            print('val   ${_value}');
          });
        },
        hint: Text("Select item"));
  }

  _createProductClick() async {
    // SERVER API URL

    await startUpload(_imageFileList![0]);
    var url = Uri.parse('${weburi}/create_product.php');
    var img_url = "/shop${_value}/${_uploadFileName}";
    var data = {
      'shopid': '${_value}',
      'name': '${productName.text}',
      'description': '${proDuctDescription.text}',
      'code': '${_value}',
      'image_url': '${img_url}',
      'price': '${productPrice.text}',
      'rating': 0,
      'isFavourite': 0,
      'isready': 1,
    };
    //print('ddddddd  ${data}');
    //print('ddddddd  ${json.encode(data)}');

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));
   // print('ddddddd  ${response.body}');
    // Getting Server response into variable.
    var message = jsonDecode(response.body);
    url = Uri.parse('${weburi}/load_product.php');
    var responsep = await http.post(url, body: json.encode(data));
   // print('ddddddd  ${responsep.body}');
    // Getting Server response into variable.
    var messagep = jsonDecode(responsep.body);
    setState(() {
      Shop1 =
          List<Product>.from(messagep.map((model) => Product.fromJson(model)));
      _isLoading = false;
       productName.text="";
       proDuctDescription.text="";
       productPrice.text="";
      print('Shop1====  ${Shop1.length}');
    });
    Navigator.pop(context);
    // If Web call Success than Hide the CircularProgressIndicator.
    if (message == "true") {
      //  Navigator.pushNamed(context, HomeScreen.routeName);

    } else {
      //  addError(error: kAlreadyHavethisUser);

    }

    print('_signupClick  end');
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      //initialValue: "kritsanai@harmonious.co.th",
      controller: productName,
      keyboardType: TextInputType.text,
      //onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          //removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          // removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          // addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          // addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "ชื่อสินค้า",
        hintText: "ระบุชื่อสินค้า",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/edit.svg"),
      ),
    );
  }

  TextFormField buildDescriptionFormField() {
    return TextFormField(
      //initialValue: "kritsanai@harmonious.co.th",
      controller: proDuctDescription,
      keyboardType: TextInputType.text,
      //onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          //removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          // removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          // addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          // addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "รายละเอียดสินค้า",
        hintText: "ระบุรายละเอียดสินค้า",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/edit.svg"),
      ),
    );
  }

  TextFormField buildPriceFormField() {
    return TextFormField(
      //initialValue: "kritsanai@harmonious.co.th",
      controller: productPrice,
      keyboardType: TextInputType.number,
      //onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          //removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          // removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          // addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          // addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "ราคา",
        hintText: "ระบุราคา",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/edit.svg"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(getProportionateScreenWidth(5)),
        // height: getProportionateScreenWidth(340),
        //  width: getProportionateScreenWidth(340),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: !kIsWeb && defaultTargetPlatform == TargetPlatform.android
            ? FutureBuilder<void>(
                future: retrieveLostData(),
                builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Column(children: [
                        buildNameFormField(),
                      ]);
                    case ConnectionState.done:
                      return _handlePreview();
                    default:
                      if (snapshot.hasError) {
                        return Text(
                          'Pick image/video error: ${snapshot.error}}',
                          textAlign: TextAlign.center,
                        );
                      } else {
                        return Column(children: [
                          buildNameFormField(),
                        ]);
                      }
                  }
                },
              )
            : _handlePreview(),
      ),
      /*
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Semantics(
            label: 'image_picker_example_from_gallery',
            child: FloatingActionButton(
              onPressed: () {
                print('FloatingActionButton');
                isVideo = false;
                _onImageButtonPressed(ImageSource.gallery, context: context);
              },
              heroTag: 'image0',
              tooltip: 'Pick Image from gallery',
              child: const Icon(Icons.photo),
            ),
          ),
        ],
      ),

       */
    );
  }

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add optional parameters'),
            content: Column(
              children: <Widget>[
                TextField(
                  controller: maxWidthController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration:
                      InputDecoration(hintText: "Enter maxWidth if desired"),
                ),
                TextField(
                  controller: maxHeightController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration:
                      InputDecoration(hintText: "Enter maxHeight if desired"),
                ),
                TextField(
                  controller: qualityController,
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(hintText: "Enter quality if desired"),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                  child: const Text('PICK'),
                  onPressed: () {
                    double? width = maxWidthController.text.isNotEmpty
                        ? double.parse(maxWidthController.text)
                        : null;
                    double? height = maxHeightController.text.isNotEmpty
                        ? double.parse(maxHeightController.text)
                        : null;
                    int? quality = qualityController.text.isNotEmpty
                        ? int.parse(qualityController.text)
                        : null;
                    onPick(width, height, quality);
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }
}

typedef void OnPickImageCallback(
    double? maxWidth, double? maxHeight, int? quality);

class AspectRatioVideo extends StatefulWidget {
  AspectRatioVideo(this.controller);

  final VideoPlayerController? controller;

  @override
  AspectRatioVideoState createState() => AspectRatioVideoState();
}

class AspectRatioVideoState extends State<AspectRatioVideo> {
  VideoPlayerController? get controller => widget.controller;
  bool initialized = false;

  void _onVideoControllerUpdate() {
    if (!mounted) {
      return;
    }
    if (initialized != controller!.value.isInitialized) {
      initialized = controller!.value.isInitialized;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();

    controller!.addListener(_onVideoControllerUpdate);
  }

  @override
  void dispose() {
    controller!.removeListener(_onVideoControllerUpdate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (initialized) {
      return Center(
        child: AspectRatio(
          aspectRatio: controller!.value.aspectRatio,
          child: VideoPlayer(controller!),
        ),
      );
    } else {
      return Container();
    }
  }
}
