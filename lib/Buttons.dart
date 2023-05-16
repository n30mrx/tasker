// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class MySaveButton extends StatelessWidget {
  VoidCallback onPressed;
  MySaveButton({
    super.key,
    required this.onPressed
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
      width: double.infinity,
      child: FilledButton(
        onPressed: onPressed, 
        child: const Text("Save")
        ),
    );
  }
}

class MyCancelButton extends StatelessWidget {
  VoidCallback onPressed;
  MyCancelButton({
    super.key,
    required this.onPressed
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed, 
        child: const Text("Cancel")
        ),
    );
  }
}