import 'package:flutter/material.dart';
import 'package:flutter_openstreetmap/home_screen.dart';
import 'package:flutter_openstreetmap/map_tile_layer_screen.dart';
import 'package:flutter_openstreetmap/map_marker_layer_screen.dart';
import 'package:flutter_openstreetmap/map_markers_layer_screen.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
   
      body: <Widget>[
        const HomeScreen(),
        const MapTileLayerScreen(),
        const MapMarkerScreen(),
        const MapMarkersScreen(),
      ][currentPageIndex],
    
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.map),
            icon: Icon(Icons.map_outlined),
            label: 'TileLayer',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.map),
            icon: Icon(Icons.map_outlined),
            label: 'MarkerLayer',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.holiday_village),
            icon: Icon(Icons.holiday_village_outlined),
            label: 'MarkersLayer',
          ),
        ],
      ),
    );
  }
}