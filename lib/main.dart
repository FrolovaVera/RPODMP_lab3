import 'package:flutter/material.dart';
import 'package:lab3/Screens/HomeScreenQR.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreenQR(),
    );
  }
}
