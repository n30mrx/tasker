// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field


import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasker/add_task_dialog.dart';
import 'package:tasker/data/database.dart';
import 'package:tasker/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //reference the hive box
  final _myBox = Hive.box('myBox');
  ToDoDatabase db = ToDoDatabase();


  @override
  void initState() {
    if (_myBox.get("TodoList") == null) {
      db.createInitialData();
    } else {
      // This is not the first time the user opens the app
      db.loadData();
    }

    // if this is the first time to open the app then load the default data

    super.initState();
  }

  // text controller
  final _controller = TextEditingController();

  // List of ToDo tasks

  //checkbox change handler
  void checkboxChanged(bool? p0, int index) {
    setState(() {
      db.myToDo[index][1] = !db.myToDo[index][1];
    });
    db.updateData();
  }

  // Save new Todo task
  void saveNewTask() {
    setState(() {
      db.myToDo.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  //Task creation
  void addTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveNewTask,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Center(child: Text('Todo')),
      ),
      body: ListView.builder(
        itemCount: db.myToDo.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.myToDo[index][0],
            isDone: db.myToDo[index][1],
            onChanged: (p0) => checkboxChanged(p0, index),
            deleteTask: (p0) {
              setState(() {
                db.myToDo.removeAt(index);
              });
              db.updateData();
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Add task"),
        icon: Icon(Icons.add),
        onPressed: addTask,
      ),
    );
  }
}
