import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /* return Scaffold(
      appBar: AppBar(
        title: const Text('messages appbar'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('messages'),
      ),
      //bottomNavigationBar: const CustomBottomNavigation(),

    ); */


    return const Center(
        child: Text('messages without scaffold'),
    );
  }
}