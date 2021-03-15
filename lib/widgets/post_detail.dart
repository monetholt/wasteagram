import 'package:flutter/material.dart';
import '../models/post.dart';

class PostDetail extends StatelessWidget {
  final Post post;

  const PostDetail({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Center(child: Text(post.formattedDate())),
                  Center(child: displayImage(post.imageURL)),
                  Center(child: Text('Quantity: ${post.quantity.toString()}')),
                  Center(
                      child: Text(
                          'Latitude: ${post.latitude.toString()}, Longitude: ${post.longitude.toString()}')),
                ]
              )));
    });
  }


  Widget displayImage(url){
    if(url == null || url == ""){
      return Container(
          height: 500,
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
          child: Center(child: Text("No image"),)
      );
    }
    else return Image.network(post.imageURL, height: 500);
  }
}
