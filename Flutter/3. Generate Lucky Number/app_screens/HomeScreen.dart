import 'dart:math';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
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
              "Your lucky number is ${generateLuckyNumber()}", // [{}] it's important
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }

  int generateLuckyNumber(){
    var random = Random();
    int number = random.nextInt(100);
    return number;
  }
}
