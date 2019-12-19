import 'dart:async' as prefix0;

import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';       // Deals with file and folder
import 'package:path_provider/path_provider.dart'; // find default path in android and ios
import 'package:tenant_manager/models/note.dart';

class DatabaseHelper{
  // Singleton object, singleton means this instance will initialise once
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper
  factory DatabaseHelper(){
    if(_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance(); // this is executed only once singleton object
    }
      return _databaseHelper;

  }

  Future<Database> get database async{
    if(_database == null){
      _database = await initializeDatabase();
    }
    return _database;
  }
  Future<Database> initializeDatabase() async{
    // Get directory for both android and ios
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    // Open/create the database at a given path
    var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }
  void _createDb(Database db, int newVersion) async{

    await db.execute('CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT,'
        '$colDescription TEXT, $colPriority INTEGER, $colDate TEXT)');
  }

  // Fetch operation
 Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;
  //  var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');  // writing raw SQL
    var result = await db.query(noteTable, orderBy: '$colPriority ASC');  // Helper function
  return result;
}

// Insert Operation
Future<int> insertNote(Note note) async{
    Database db = await this.database;
    var result = await db.insert(noteTable, note.toMap());
    return result;
}

// Update operation
Future<int> updateNote(Note note) async{
    var db = await this.database;
    var result = await db.update(noteTable, note.toMap(), where:  '$colId = ?',  whereArgs: [note.id]);
    return result;
}

// Delete Operation
  Future<int> deleteNote(int id) async{
    var db = await this.database;
    var result = await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
    return result;
  }

  // Get number of Note objects in database
prefix0.Future<int> getCount() async{
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $noteTable');
    int result = Sqflite.firstIntValue(x);
    return result;
}

// Get the 'Map List' and convert to note list
Future<List<Note>> getNoteList() async{
    var noteMapList = await getNoteMapList(); // Get map list from database
    int count = noteMapList.length;

    List<Note> noteList = List<Note>();

    // for loop to create a note list from map list
  for(int i = 0; i<count; i++){
    noteList.add(Note.fromMapObject(noteMapList[i]));

  }

  return noteList;
}
}