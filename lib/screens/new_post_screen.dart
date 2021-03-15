import 'package:flutter/material.dart';
import '../widgets/new_post.dart';

class NewPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Wasteagram"),
        ),
        body: NewPost(),
    );
  }
}