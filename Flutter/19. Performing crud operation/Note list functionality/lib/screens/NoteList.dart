import 'package:flutter/material.dart';
import 'package:tenant_manager/screens/NoteDetail.dart';
import 'package:tenant_manager/models/note.dart';
import 'package:tenant_manager/utils/database_helper.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';


class  NoteList  extends StatefulWidget{
  // new..
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;
  // up..
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  // Down..
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  // up...
  int count = 0;
  @override
  Widget build(BuildContext context) {
    if(noteList == null){
      noteList = List<Note>();
      updateListView();
    }
    return Scaffold(
      appBar: AppBar(title: Text("Notes"),),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          debugPrint('Fab Clicked');
          navigateToDetail(Note('','',2),'Add Note');
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
                backgroundColor: getPriorityColor(this.noteList[position].priority),  // changed during sql crud operation
                child: getPriorityIcon(this.noteList[position].priority), // changed during sql crud operation
              ),

              title: Text(this.noteList[position].title, style: textStyle,),// changed during sql crud operation
              subtitle: Text(this.noteList[position].date),// changed during sql crud operation
              trailing: GestureDetector(child: Icon(Icons.delete, color: Colors.grey,), onTap: (){
                _delete(context, noteList[position]);

              },),

              onTap: () {
                navigateToDetail(this.noteList[position], 'Edit Note');
              } ),
        );
      },
    );
  }
  //Down..
  // Return priority color
  Color getPriorityColor(int priority){
    switch (priority){
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.yellow;
        break;
      default:
        return Colors.yellow;
    }
  }

  // Return priority icon
  Icon getPriorityIcon(int priority){
    switch (priority){
      case 1:
      return Icon(Icons.play_arrow);
      break;

      case 2:
        return Icon(Icons.keyboard_arrow_right);
        break;

      default:
        return Icon(Icons.keyboard_arrow_right);
    }
  }

  void _delete(BuildContext context, Note note) async{
    int result = await databaseHelper.deleteNote(note.id);
    if(result != 0){
      _showSnackBar(context, 'Note Deleted Successfully');
      // Todo update the list view
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message)
  {
    final snackBar = SnackBar(content: Text(message),);
    Scaffold.of(context).showSnackBar(snackbar);
  }

  // up...
  void navigateToDetail(Note note, String title){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return NoteDetail(note, title);
    }));
  }

  // down..
void updateListView(){
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database){
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList){
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
}
