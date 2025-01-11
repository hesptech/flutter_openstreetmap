import 'package:flutter/material.dart';
import 'package:flutter_openstreetmap/cancellable_tile_provider.dart';
import 'package:flutter_openstreetmap/home_screen.dart';
import 'package:flutter_openstreetmap/map_property_screen.dart';
//import 'package:flutter_openstreetmap/messages_screen.dart';
import 'package:flutter_openstreetmap/notifications_screen.dart';

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
        /// Home page
        const HomeScreen(),
        const NotificationsScreen(),
        //const MessagesScreen(),
        const MapPropertyScreen(),
        const CancellableTileProviderPage(),
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
            icon: Badge(
              child: Icon(Icons.notifications_sharp),
            ),
            label: 'Notifications',
          ),
          /* NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.messenger_sharp),
            ),
            label: 'Messages',
          ), */
          NavigationDestination(
            selectedIcon: Icon(Icons.map),
            icon: Icon(Icons.map_outlined),
            label: 'Map',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.map),
            icon: Icon(Icons.map_outlined),
            label: 'Map 2',
          ),
        ],
      ),
    );
  }
}