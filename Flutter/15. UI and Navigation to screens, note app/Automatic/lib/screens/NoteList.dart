import 'package:flutter/material.dart';
import 'package:tenant_manager/screens/NoteDetail.dart';

class  NoteList  extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList>{
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes"),),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          debugPrint('Fab Clicked');
          navigateToDetail('Add Note');
          },
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getNoteListView(){
    TextStyle textStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position){
          return Card(
            color: Colors.white,
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Icon(Icons.keyboard_arrow_right),
              ),

              title: Text("Title", style: textStyle,),
              subtitle: Text("Date"),
              trailing: Icon(Icons.delete, color: Colors.grey,),

              onTap: () {
                debugPrint('List Item Clicked');
                navigateToDetail('Edit Note');
              } ),
          );
        },
    );
  }

  void navigateToDetail(String title){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return NoteDetail(title);
      }));
    }
  }
