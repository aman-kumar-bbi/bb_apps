import 'package:bb_apps/bb_apps.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(
    listofBBAppsToDisplay: const [],
  ));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  List listofBBAppsToDisplay;
  MyApp({Key? key, required this.listofBBAppsToDisplay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BBAppHome(
        bbAppListFromFirebase: listofBBAppsToDisplay,
        navBarColor: Colors.orange,
        navBarStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}
