import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(title: "Dropdown menu",home: Home(),));

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home>{
  var currencies = ['Rupees', 'Dollars', 'Pounds', 'Others'];
  var currentItemSelected = 'Rupees';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dropdown Button"),),
      body: Container(
        child: DropdownButton<String>(
          items: currencies.map((String dropDownStringItem){
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Text(dropDownStringItem),
            );
          }).toList(),

          onChanged: (String newValueSelected){
            setState(() {
              this.currentItemSelected = newValueSelected;
            });
          },
          value: currentItemSelected,
        ),
      ),
    );
  }
  
}

