// ignore_for_file: unused_field

import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{
  //create an empty list
  List myToDo = [];
  
  // reference the box
  final _myBox = Hive.box("myBox");

// run this if it is the first time ever to open the app
  void createInitialData(){
    myToDo = [
      ["Click The \"Add task\" button to add a new task", false],
      ["Click the checkbox to mark a task as done!", true],
      ["Slide a task to left to delete it", false]
    ];
  }

  // Load the data from the database
  void loadData(){
    myToDo=_myBox.get("TodoList");
  }

  // update the database
  void updateData(){
    _myBox.put("TodoList", myToDo);
  }


}