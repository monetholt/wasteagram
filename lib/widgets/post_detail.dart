import 'package:flutter/material.dart';
import '../models/post.dart';

class PostDetail extends StatelessWidget {
  final Post post;

  const PostDetail({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(post.formattedDate()),
              Expanded(child: displayImage(post.imageURL)),
              Center(child: Text('Number of Items: ${post.quantity.toString()}')),
              Center(
                  child: Text(
                      'Latitude: ${post.latitude.toString()}, Longitude: ${post.longitude.toString()}')),
            ])));
  }

  Widget displayImage(url) {
    if (url == null || url == "") {
      return Container(
          height: 500,
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
          child: Center(
            child: Text("No image"),
          ));
    } else
      return Image.network(post.imageURL);
  }
}
