import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wasteagram"),
      ),
      body: Center(child: Text("Welcome!")),
    );
  }
}
