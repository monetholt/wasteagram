import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('posts').snapshots(),
      builder: (content, snapshot){
        if(snapshot.hasData && snapshot.data.documents != null && snapshot.data.documents.length > 0){
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index){
              var post = snapshot.data.documents[index];
              return ListTile(
                leading: Text(post['quantity'].toString()),
                title: Text(post['date'].toString())
              );
            }
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }
    );
  }
}