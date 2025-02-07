import 'package:flutter/material.dart';
import 'package:Weather/Activity/home.dart';
import 'package:Weather/Activity/loading.dart';
//import 'package:weather/Activity/location.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => Loading(),
        "/home": (context) => Home(),
        "/loading": (context) => Loading(),
      },
    ),
  );
}
