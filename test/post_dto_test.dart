import 'package:test/test.dart';
import 'package:wasteagram/db/post_dto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main(){
  test('Post DTO Map should have appropriate property values', (){
    final date = DateTime.parse('2021-02-02');
    const url = 'FAKE';
    const quantity = 2;
    const latitude = 1.0;
    const longitude = 3.0;

    final postDTO = PostDTO();

    postDTO.date = date;
    postDTO.imageURL = url;
    postDTO.quantity = quantity;
    postDTO.latitude = latitude;
    postDTO.longitude = longitude;

    expect(postDTO.toMap(), {'date': date, 'imageURL': url, 'quantity': quantity, 'location': new GeoPoint(latitude, longitude)});
  });
}
