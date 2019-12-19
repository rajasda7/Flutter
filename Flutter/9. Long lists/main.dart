import 'package:flutter/material.dart';
import 'package:flutter_app/app_screens/HomeScreen.dart';

void main() => runApp(MaterialApp(title: "List view", home: Scaffold(
  appBar: AppBar(title: Text("MY List View"),), body: getListView(),
),),);

List<String> getListElements(){

  var items = List<String>.generate(1000, (counter) => "Item $counter");
  return items;
}

Widget getListView(){
  var listItems = getListElements();
  var listView = ListView.builder(
    itemBuilder: (context, index){
      return ListTile(
        onTap: (){
          debugPrint("${listItems[index]} was tapped");
        },
        leading: Icon(Icons.arrow_left),
        title: Text(listItems[index]),
      );
    },
  );
  return listView;
}
