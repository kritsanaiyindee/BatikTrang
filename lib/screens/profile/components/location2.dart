import 'package:batiktrang/components/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../constants.dart';
import '../../../enums.dart';



class MarkerIconsBody2 extends StatefulWidget {

  final String  location;
  final String  name;
  final double lat;
  final double lng;
 // final LatLng latlng;
  const MarkerIconsBody2({
    Key? key,
    required this.location,
    required this.name,
    required this.lat,
    required this.lng,
 //   required this.latlng,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => MarkerIconsBodyState2();
}

const LatLng _tm = LatLng(7.443838181759113, 99.54926246523647);
class MarkerIconsBodyState2 extends State<MarkerIconsBody2> {
  GoogleMapController? controller;
  BitmapDescriptor? _markerIcon;


  @override
  Widget build(BuildContext context) {
   // const LatLng _ll=LatLng(this.widget.lat, this.widget.lng);

    _createMarkerImageFromAsset(context);
    return
      Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: SizedBox(
                width: 350.0,
                height: 450.0,
                child: GoogleMap(
                  mapType: MapType.hybrid,

                  initialCameraPosition: const CameraPosition(
                    target:_tm,
                    zoom: 16.0,
                  ),
                  markers: <Marker>{_createMarker()},
                  onMapCreated: _onMapCreated,
                ),
              ),
            )
          ],
        ),
        backgroundColor: logoColor,
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),

      );



      ;
  }

  Marker _createMarker() {
    if (_markerIcon != null) {
      return Marker(
        markerId: MarkerId("marker_1"),
        position: _tm,
        icon: _markerIcon!,
      );
    } else {
      return Marker(
        markerId: MarkerId("marker_1"),
        position: _tm,
      );
    }
  }

  Future<void> _createMarkerImageFromAsset(BuildContext context) async {
    if (_markerIcon == null) {
      final ImageConfiguration imageConfiguration =
      createLocalImageConfiguration(context, size: Size.square(48));
      BitmapDescriptor.fromAssetImage(
          imageConfiguration, 'assets/red_square.png')
          .then(_updateBitmap);
    }
  }

  void _updateBitmap(BitmapDescriptor bitmap) {
    setState(() {
      _markerIcon = bitmap;
    });
  }

  void _onMapCreated(GoogleMapController controllerParam) {
    setState(() {
      controller = controllerParam;

    });
  }
}