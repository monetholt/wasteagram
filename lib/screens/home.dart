import 'package:flutter/material.dart';
import '../widgets/post_list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wasteagram"),
      ),
      body: PostList(),
      floatingActionButton: Builder(builder: (context) {
        return Semantics(
            label: "Click to upload a new photo of food waste.",
            enabled: true,
            button: true,
            child: FloatingActionButton(
                child: Icon(Icons.camera),
                onPressed: () {
                  Navigator.of(context).pushNamed('/new_post');
                }));
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
