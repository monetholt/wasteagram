import 'package:flutter/material.dart';
import '../models/post.dart';
import '../widgets/post_detail.dart';

class PostDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Post post = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text("Wasteagram"),
        ),
        body: PostDetail(post: post),
    );
  }
}