import 'package:flutter/material.dart';
import 'package:tenant_manager/screens/NoteDetail.dart';
import 'package:tenant_manager/screens/NoteList.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Softnotes",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: NoteList(),
    )
  );
}