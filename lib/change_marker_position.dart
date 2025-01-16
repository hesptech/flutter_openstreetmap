import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

class ChangeMarkerPosition extends StatefulWidget {
  const ChangeMarkerPosition({super.key});

  @override
  State<ChangeMarkerPosition> createState() => _ChangeMarkerPositionState();
}

class _ChangeMarkerPositionState extends State<ChangeMarkerPosition> {
  late MapController mapController;
  late latLng.LatLng markerPosition;

  @override
  void initState() {
    mapController = MapController();
    markerPosition = const latLng.LatLng(43.651070, -79.347015);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FlutterMap(
          mapController: mapController,
          options: MapOptions(
            initialCenter: markerPosition,
            initialZoom: 9.2,
            onPositionChanged: (position, hasGesture) {},
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.flutter_openstreetmap',
            ),
            /* MarkerLayer(
              markers: getMarkers(),
            ),
            LocationMarkerLayer(
              positi
            ), */
          ],
        ),
      ),
    );
  }
}