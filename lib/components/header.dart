import 'package:flutter/material.dart';

AppBar appBar({required String title}) {
  return AppBar(
    title: Center(
      child: Text(
        title,
        style: TextStyle(
          color: Colors.teal,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
    ),
    shadowColor: Color.fromARGB(184, 217, 217, 217),
    backgroundColor: Color(0xffd9d9d9),
  );
}
