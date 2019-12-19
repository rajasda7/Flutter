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
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              width: 250,
              height: 50,
              child: RaisedButton(        // Raised button with elevation
                onPressed: () => registeredSuccessfully(context),// AlertDialog below as void
                color: Colors.deepOrange,
                elevation: 6,
                child: Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ),
          ],
        )
      ),
    );


  }
  void registeredSuccessfully(BuildContext context){  // AlertDialog

    var alertDialog= AlertDialog(
      title: Text("Registration Succeed"),
      content: Text("Your Details registered successfully."),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) => alertDialog

    );
  }
}
