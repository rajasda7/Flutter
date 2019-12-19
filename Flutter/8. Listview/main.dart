import 'package:flutter/material.dart';
import 'package:flutter_app/app_screens/HomeScreen.dart';

void main() => runApp(MaterialApp(title: "List view", home: Scaffold(
  appBar: AppBar(title: Text("MY List View"),),
  body: getListView(),
),),);

Widget getListView(){

  var listView = ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.landscape),
        title: Text("Landscape"),
        subtitle: Text("Beautiful view!"),
        trailing: Icon(Icons.wb_sunny),
        onTap: () => debugPrint("Landscape tapped"), // make list tap able
      ),
      ListTile(
        leading: Icon(Icons.laptop_chromebook),
        title: Text("Landscape"),
      ),
      Text("A text element"),
      Container(color: Colors.red, height: 50,)
    ],
  );
  return listView;
}