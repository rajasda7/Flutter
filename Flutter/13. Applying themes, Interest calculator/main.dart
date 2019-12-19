import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Interest Calculator",
    home: SIForm(),
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.indigo,
      accentColor: Colors.indigoAccent,
    ),
  ));
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SIFormState();
  }
}

class SIFormState extends State<SIForm> {
  var currencies = ['Rupees', 'Pounds', 'Dollars', 'Others'];
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      //   resizeToAvoidBottomPadding: false,     // no use of it for smaller screens use list view in place of column
        appBar: AppBar(
          title: Text("Interest Calculator"),

        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Image(
                image: AssetImage('images/carimgforSI.jpg'),
                width: 125,
                height: 125,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                ),
                child: TextField(
                  style: textStyle,
                  decoration: InputDecoration(
                    labelText: 'Principal',
                    labelStyle: textStyle,
                    hintText: 'Enter Principle e.g. 1200',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                ),
                child: TextField(
                  style: textStyle,
                  decoration: InputDecoration(
                    labelText: 'Rate of interest',
                    labelStyle: textStyle,
                    hintText: 'In percent',
                    border: OutlineInputBorder(             // giving circular border to text field
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          style: textStyle,
                          decoration: InputDecoration(  // decorating the text field
                            labelText: 'Term',
                            labelStyle: textStyle,
                            hintText: 'Time in years',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          keyboardType: TextInputType.number,           //  input type
                        ),
                      ),
                      Container(                                   // used for space
                        width: 25,
                      ),
                      Expanded(
                        child: DropdownButton<String>(
                          items: currencies.map((String value) {   // map works as loop
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          value: 'Rupees',
                          onChanged: (String newValueSelected) {},
                        ),
                      )
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).accentColor,
                          textColor: Theme.of(context).primaryColorDark,
                          child: Text("Calculate",textScaleFactor: 1.5,),
                          onPressed: () {},
                        ),
                      ),
                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text("Reset",textScaleFactor: 1.5,),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  )),

              Padding(
                padding: EdgeInsets.all(10),
                child: Text("Todo Text",style: textStyle,),
              )
            ],
          ),
        ));
  }
}
