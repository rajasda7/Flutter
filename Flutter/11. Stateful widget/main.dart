import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      title: "Stateful app",
      home: FavaouriteCity(),
    )
  );
}

class FavaouriteCity extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return FavaouriteCityState();
  }
}

class FavaouriteCityState extends State<FavaouriteCity>{
  String nameCity ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stateful Example"),),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              style: TextStyle(fontSize: 20),
              onChanged: (String userInput){ ///on submitted can be used
                setState(() {
                  nameCity = userInput;

                });
              },
            ),

            Padding( padding:EdgeInsets.all(30),child:Text(
              "Your best city is $nameCity",
              style: TextStyle(fontSize: 20),
            ),),
          ],
        ),
      ),
    );
  }

}