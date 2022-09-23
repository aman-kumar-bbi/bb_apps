import 'package:bb_apps/bb_apps.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(
    listofBBAppsToDisplay: [],
  ));
}

class MyApp extends StatelessWidget {
  List listofBBAppsToDisplay;
  MyApp({required this.listofBBAppsToDisplay});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BBAppHome(
        appBarTitle: 'BB Apps',
        navBarColor: Colors.blue,
        navBarStyle: TextStyle(color: Colors.pink),
        bbAppListFromFirebase: listofBBAppsToDisplay,
      ),
    );
  }
}
