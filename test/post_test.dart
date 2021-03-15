import 'package:test/test.dart';
import 'package:wasteagram/models/post.dart';

void main(){
  test('Post created from constructor should have appropriate property values', (){
    final date = DateTime.parse('2021-02-02');
    const url = 'FAKE';
    const quantity = 2;
    const latitude = 1.0;
    const longitude = 3.0;

    final post = Post(
      date: date,
      imageURL: url,
      quantity: quantity,
      latitude: latitude,
      longitude: longitude
    );

    expect(post.date, date);
    expect(post.imageURL, url);
    expect(post.quantity, quantity);
    expect(post.latitude, latitude);
    expect(post.longitude, longitude);
  });
}
