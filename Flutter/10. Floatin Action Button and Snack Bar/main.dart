import 'package:flutter/material.dart';
import 'package:flutter_app/app_screens/HomeScreen.dart';

void main() => runApp(
      MaterialApp(
        title: "List view",
        home: Scaffold(
          appBar: AppBar(
            title: Text("MY List View"),
          ),
          floatingActionButton: FloatingActionButton(   // floating action button
            tooltip: "Add a item",       // on long click show info
            onPressed: () {},
            child: Icon(Icons.add),      // icon of fab
          ),
          body: getListView(),
        ),
      ),
    );

List<String> getListElements() {
  var items = List<String>.generate(1000, (counter) => "Item $counter");
  return items;
}

Widget getListView() {
  var listItems = getListElements();
  var listView = ListView.builder(
    itemBuilder: (context, index) {
      return ListTile(
        onTap: () {
          showSnackBar(context, listItems[index]);  // on tap of list item shows snack bar
        },
        leading: Icon(Icons.arrow_left),
        title: Text(listItems[index]),
      );
    },
  );
  return listView;
}

// Snack bar function
void showSnackBar(BuildContext context, String item) {
  var snackBar = SnackBar(
    content: Text("You just tapped $item"),
    action: SnackBarAction(         // action like undo in snack bar
      label: "Undo",
      onPressed: () => debugPrint("Undo clicked"),
    ),
  );
  Scaffold.of(context).showSnackBar(snackBar);  // needs scaffold context
}
