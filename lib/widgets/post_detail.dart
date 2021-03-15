import 'package:flutter/material.dart';
import '../models/post.dart';

class PostDetail extends StatelessWidget {
  final Post post;

  const PostDetail({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(child: Text(post.date.toString())),
                Center(child: Image.network(post.imageURL)),
                Center(child: Text('Quantity: ${post.quantity.toString()}')),
                Center(child: Text('Latitude: ${post.latitude.toString()}, Longitude: ${post.longitude.toString()}')),
              ]);
  }
}