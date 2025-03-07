import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';

class MapMarkerScreen extends StatelessWidget {
  static String pathScreen = "map_property_screen";

  const MapMarkerScreen({super.key});

  @override
  Widget build(BuildContext context) {

    //final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterMap MarkerLayer', style: TextStyle(fontSize: 26)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 34,
            )),
        elevation: 0,
        toolbarHeight: 60,
        centerTitle: true,
      ),
      backgroundColor: null,
      body: SafeArea(
        bottom: false,
        child: SizedBox( 
          //width: 200,
          //height: 300,
          child: FlutterMap(
            options: MapOptions(
              initialCenter: const LatLng(43.651070, -79.347015),
              initialZoom: 17,
              /* interactionOptions: InteractionOptions(
                flags: screenSize.width  < 950 ? InteractiveFlag.pinchZoom : InteractiveFlag.all
                //flags: InteractiveFlag.doubleTapZoom

              ), */
              cameraConstraint: CameraConstraint.contain(
                bounds: LatLngBounds(
                  const LatLng(-90, -180),
                  const LatLng(90, 180),
                ),
              ),
            ),
            children: [
              openStreetMapTileLayer,
              const MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(43.651070, -79.347015),
                    width: 80.0,
                    height: 80.0,
                    alignment: Alignment.center,
                    /* child: Icon(
                      Icons.location_on_outlined, 
                      color: Colors.red, 
                      size: 40.0,
                    ), */
                    child: Column(
                      children: [
                        Icon(
                          Icons.location_on_outlined, 
                          color: Colors.red, 
                          size: 40.0,
                        ),
                        Text(
                          'Toronto',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    /* child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/124/124021.png', 
                      width: 40, 
                      height: 40, 
                      fit: BoxFit.fill,
                    ), */
                  ),
                ],)
            ],  
          ),
        ),
      ),
    );
  }

  TileLayer get openStreetMapTileLayer => TileLayer(
    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
    userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    tileProvider: CancellableNetworkTileProvider(),
  );
}