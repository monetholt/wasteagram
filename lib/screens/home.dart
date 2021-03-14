import 'package:flutter/material.dart';
import 'share_location_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wasteagram"),
      ),
      body: ShareLocationScreen(),
    );
  }
}
