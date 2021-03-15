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
          return FloatingActionButton(
              child: Icon(Icons.camera),
              onPressed: () {
                Navigator.of(context).pushNamed('/new_post');
              });
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
