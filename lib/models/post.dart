import 'package:intl/intl.dart';

class Post{
  final DateTime date;
  final String imageURL;
  final int quantity;
  final double latitude;
  final double longitude;

  const Post({ this.date, this.imageURL, this.quantity, this.latitude, this.longitude});

  String formattedDate(){
    return DateFormat('MM/dd/yyyy kk:mm').format(date);
  }
}