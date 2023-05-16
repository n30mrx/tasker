// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:tasker/Buttons.dart';

class DialogBox extends StatelessWidget {
  DialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
    });
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("New task"),
      content: SizedBox(
        height: 150,
        child: Column(
          children: [
            // Get use input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your task here",
                labelText: "Task name"
              ),
            ),
            MySaveButton(onPressed: onSave),
            MyCancelButton(onPressed: onCancel)
            //add buttons(save and cancel buttons)
            
          ],
        ),
      ),
    );
  }
}