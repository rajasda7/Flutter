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
  var formKey = GlobalKey<FormState>();
  var currencies = ['Rupees', 'Pounds', 'Dollars', 'Others'];
  var currentItemSelected = ''; // It cant be used s index[0] because only static member is allowed. so use init()
  @override
  void initState() {
    super.initState();
    currentItemSelected = currencies[0];
  }

  var displayResult = "";

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
        //   resizeToAvoidBottomPadding: false,     // no use of it for smaller screens use list view in place of column
        appBar: AppBar(
          title: Text("Interest Calculator"),
        ),
        body: Form(                  //  We use form for validation...
          key: formKey,
            child: Padding(
          padding: EdgeInsets.all(10),
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
                child: TextFormField(
                  style: textStyle,
                  controller: principalController,
                  validator: (String value){
                    if(value.isEmpty){ return 'Please enter principal amount';}
                  },
                  decoration: InputDecoration(
                    labelText: 'Principal',
                    labelStyle: textStyle,

                    errorStyle: TextStyle(color:Colors.yellowAccent,fontSize: 15),    // used to change color of error text
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
                child: TextFormField(
                  style: textStyle,
                  validator: (String value){
                    if(value.isEmpty{
                      return 'Please enter rate of interest';
                    }
                    if(double.tryParse(value) == null) {return 'Please enter a valid amount';} // Use double.parse for validate user input a number
                  },
                  controller: roiController,
                  decoration: InputDecoration(
                    labelText: 'Rate of interest',
                    labelStyle: textStyle,
                    errorStyle: TextStyle(color: Colors.yellowAccent, fontSize: 15),
                    hintText: 'In percent',
                    border: OutlineInputBorder(
                      // giving circular border to text field
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
                        child: TextFormField(
                          style: textStyle,
                          controller: termController,
                          validator: (String value){
                            if(value.isEmpty){
                              return 'Please enter term';
                            }
                          },
                          decoration: InputDecoration(
                            // decorating the text field
                            labelText: 'Term',
                            labelStyle: textStyle,
                            errorStyle: TextStyle(color: Colors.yellowAccent,fontSize: 15),
                            hintText: 'Time in years',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          keyboardType: TextInputType.number, //  input type
                        ),
                      ),
                      Container(
                        // used for space
                        width: 25,
                      ),
                      Expanded(
                        child: DropdownButton<String>(
                          items: currencies.map((String value) {
                            // map works as loop
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          value: currentItemSelected,
                          onChanged: (String newValueSelected) {
                            setState(() {
                              this.currentItemSelected = newValueSelected;

                              /// Why we usw this. ? ? ?
                            });
                          },
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
                          child: Text(
                            "Calculate",
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              if(formKey.currentState.validate()){
                                this.displayResult = calculateTotalReturn();
                              }
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            "Reset",
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              reset();
                            });
                          },
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  displayResult,
                  style: textStyle,
                ),
              )
            ],
          ),
        )));
  }

  String calculateTotalReturn() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = principal + (principal * roi * term) / 100;
    String result =
        'After $term years, your investment will be worth $totalAmountPayable $currentItemSelected.';
    return result;
  }

  void reset() {
    principalController.text = '';
    roiController.text = '';
    termController.text = '';
    currentItemSelected = currencies[0];
  }
}
