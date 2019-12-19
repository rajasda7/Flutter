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
              margin: EdgeInsets.only(top: 30),
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
            Container(   // Container used for apply margin to rows
              margin: EdgeInsets.only(top: 15),
              child:  Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Age  :",
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
                      "17",
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
            Container(
              color: Colors.deepPurple,
                margin: EdgeInsets.only(top: 150),
                child: Image(
                  image: AssetImage('images/img1.png'),
                  width: 200,
                  height: 100,
                )
            )
          ],
        )
      ),
    );
  }
}
