// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool isDone;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;
  ToDoTile({
    super.key,
    required this.taskName,
    required this.isDone,
    required this.onChanged,
    required this.deleteTask,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Slidable(
        
        endActionPane: ActionPane(
          motion: StretchMotion(),
        children: [
          SlidableAction(
          onPressed: deleteTask,
          borderRadius: BorderRadius.circular(12),
          icon: Icons.delete,
          backgroundColor: Colors.red.shade300,
          )
        ]
        ),
        child: Card(
            color: Theme.of(context).colorScheme.surfaceVariant,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
      
                  // CheckBox
                  Checkbox(value: isDone, onChanged: onChanged),
      
                  // task name
                  Text(
                    taskName,
                    style: TextStyle(
                      decoration: isDone? TextDecoration.lineThrough : TextDecoration.none
                    ),
                    ),
      
                ],
              ),
            ),
          
        ),
      ),
    );
  }
}