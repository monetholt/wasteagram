import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/post.dart';

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  List<Post> posts;

  void loadPosts(postData) {
    posts = postData.map<Post>((record) {
      return Post(
        date: record['date'].toDate(),
        imageURL: record['imageURL'],
        quantity: record['quantity'],
        latitude: record['location'].latitude,
        longitude: record['location'].longitude,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance.collection('posts').snapshots(),
        builder: (content, snapshot) {
          if (snapshot.hasData &&
              snapshot.data.documents != null &&
              snapshot.data.documents.length > 0) {
            loadPosts(snapshot.data.documents);
          } else {
            loadPosts([]);
          }

          return postListView();
        });
  }

  Widget postListView() {
    if (posts.length > 0) {
      return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            var post = posts[index];
            return ListTile(
              leading: Text(post.quantity.toString()),
              title: Text(post.date.toString()),
              enabled: true,
              onTap: () {
                //route to view entry
                Navigator.of(context)
                    .pushNamed('/post_detail', arguments: posts[index]);
              },
            );
          });
    } else
      return Center(child: CircularProgressIndicator());
  }
}
