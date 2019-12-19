import 'package:flutter/material.dart';

void main() { // Main (void main) where initialisation happens, its important
  runApp(MaterialApp(
    title: "Raja",
    home: Scaffold(
      // Scaffold Used for toolbar and floating action button and many more widgets
      appBar: AppBar(
        title: Text("Flutter"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Material(
        color: Colors.lightBlue,
        child: Center(
          child: Text(
            "Hello World!",
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      ),
    ),
  ));
}
