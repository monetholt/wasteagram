import 'package:cloud_firestore/cloud_firestore.dart';

class PostDTO{
  DateTime date;
  String imageURL;
  int quantity;
  double latitude;
  double longitude;

  Map<String, dynamic> toMap(){
    return {
      'date': date,
      'imageURL': imageURL, 
      'quantity': quantity,
      'location': new GeoPoint(latitude, longitude)
    };
  }
}