import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // Container is like [div] in web development
        alignment: Alignment.center,
        color: Colors.deepPurple,
//        width: 200, // its acquiring height and width from parent ie. MaterialApp
//        height: 100, // now it have own height width because of Center
//       [margin: EdgeInsets.all(20),] // used to margin all sides between two elements
        margin: EdgeInsets.only(
            left: 35, top: 50), // used to margin only one side bw 2 elements
//        padding: EdgeInsets.all(value), // same as margin
        child: Text(
          "Raja",
          textDirection: TextDirection.ltr,
          style: TextStyle(
              decoration: TextDecoration.none,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.blue),
        ),
      ),
    );
  }
}
