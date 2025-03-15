import 'package:flutter/material.dart';
import "./pages/home.dart";

void main() {
  runApp(RootPage());
}

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      title: "QRCode Generator",
      debugShowCheckedModeBanner: false,
    );
  }
}
