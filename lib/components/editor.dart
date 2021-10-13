import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const Editor({
    Key? key,
    required this.label,
    required this.controller,
    required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
      ),
      style: const TextStyle(
        fontSize: 16,
      ),
      keyboardType: keyboardType,
      controller: controller,
      maxLines: 5,
    );
  }
}


