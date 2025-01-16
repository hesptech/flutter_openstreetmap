import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';


import 'package:latlong2/latlong.dart';

class MapTileLayerScreen extends StatefulWidget {
  static const String route = '/cancellable_tile_provider_page';

  const MapTileLayerScreen({super.key});

  @override
  State<MapTileLayerScreen> createState() =>
      _MapTileLayerScreenState();
}

class _MapTileLayerScreenState
    extends State<MapTileLayerScreen> {
  bool _providerEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FlutterMap TileLayer')),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: SwitchListTile.adaptive(
                title: const Text('Use CancellableNetworkTileProvider'),
                value: _providerEnabled,
                onChanged: (value) => setState(() => _providerEnabled = value),
              ),
            ),
          ),
          Expanded(
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
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                  tileProvider: CancellableNetworkTileProvider(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}