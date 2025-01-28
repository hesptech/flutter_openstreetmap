import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart' as lat_lng;
import 'package:flutter_openstreetmap/fakedata.dart';

class MapPositionChangedScreen extends StatefulWidget {
  const MapPositionChangedScreen({super.key});

  @override
  State<MapPositionChangedScreen> createState() => _MapPositionChangedScreenState();
}

class _MapPositionChangedScreenState extends State<MapPositionChangedScreen> {
  late MapController mapController;
  late lat_lng.LatLng markerPosition;

  List<Marker> getMarkers() {
    return List<Marker>.from(FakeData.fakeLocations.map((e) => Marker(
      point: lat_lng.LatLng(e.latitude, e.longitude), 
      child: Builder(
        builder: (context) => const Icon(
          Icons.location_on_outlined, 
          color: Colors.red, 
          size: 40.0,
        ),
      ),
    ),),);
  }

  @override
  void initState() {
    mapController = MapController();
    markerPosition = const lat_lng.LatLng(43.651070, -79.347015);
    super.initState();
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('onPositionChanged LocationMarkerLayer', style: TextStyle(fontSize: 26)),
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
      body: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          initialCenter: markerPosition,
          initialZoom: 9.2,
          onPositionChanged: (position, hasGesture) {
            setState(() {
              markerPosition = lat_lng.LatLng(position.center!.latitude, position.center!.longitude);
            });
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.flutter_openstreetmap',
          ),
          MarkerLayer(
            markers: getMarkers(),
          ),
          LocationMarkerLayer(
            position: LocationMarkerPosition(
              latitude: markerPosition.latitude,
              longitude: markerPosition.longitude,
              accuracy: 5
            ),
          ),
        ],
      ),
    );
  }
}