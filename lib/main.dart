import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  //app supports all orientations except upside down
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  runApp(App());
}