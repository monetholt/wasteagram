import 'package:flutter/material.dart';
import 'screens/home.dart';

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  final String title = "Wasteagram";

  final routes = {
    '/': (context) => Home(),
    // '/new_journal': (context) => NewJournalEntry(),
    // '/journal_detail': (context) => JournalEntryDetail()
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