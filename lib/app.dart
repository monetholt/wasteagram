import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/new_post_screen.dart';
import 'screens/post_detail_screen.dart';

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  final String title = "Wasteagram";

  final routes = {
    '/': (context) => Home(),
    '/new_post': (context) => NewPostScreen(),
    '/post_detail': (context) => PostDetailScreen()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: routes,
        initialRoute: '/' 
      );
  }
}