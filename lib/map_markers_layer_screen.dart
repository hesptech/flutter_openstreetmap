import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_openstreetmap/fakedata.dart';

class MapMarkersScreen extends StatefulWidget {
  static String pathScreen = "map_property_screen";

  const MapMarkersScreen({super.key});

  @override
  State<MapMarkersScreen> createState() => _MapMarkersScreenState();
}

class _MapMarkersScreenState extends State<MapMarkersScreen> {

  List<Marker> getMarkers() {
    return List<Marker>.from(FakeData.fakeLocations.map((e) => Marker(
      point: LatLng(e.latitude, e.longitude), 
      child: Builder(
        /* builder: (context) => const Icon(
          Icons.location_on_outlined, 
          color: Colors.red, 
          size: 40.0,
        ), */
        builder: (context) => Container(
          width: 80.0,
          height: 80.0,
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              e.name,              
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    ),),);
  }

  @override
  Widget build(BuildContext context) {



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
 
          child: FlutterMap(
            options: MapOptions(
              initialCenter: const LatLng(51.5, -0.09),
              initialZoom: 5,
              cameraConstraint: CameraConstraint.contain(
                bounds: LatLngBounds(
                  const LatLng(-90, -180),
                  const LatLng(90, 180),
                ),
              ),
            ),
            children: [
              openStreetMapTileLayer,
              MarkerLayer(
                markers: getMarkers(),
              )
            ],  
          ),
        ),
      ),
    );
  }

  TileLayer get openStreetMapTileLayer => TileLayer(
    urlTemplate: 'https://a.tile.openstreetmap.org/{z}/{x}/{y}.png',
    userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    tileProvider: CancellableNetworkTileProvider(),
  );
}