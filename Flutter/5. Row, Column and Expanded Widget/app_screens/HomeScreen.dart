import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        child: Column(
          children: <Widget>[
            Container(   // Container used for apply margin to rows
              margin: EdgeInsets.only(top: 25),
              child:  Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Name :",
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  Expanded(
                    child: Text(
                      "Raja",
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Name :",
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                ),

                Expanded(
                  child: Text(
                    "Raja",
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ],
        )
      ),
    );
  }
}
