import 'package:blog_flutter_todo_list/models/todo.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function(int) deleteFunction;

  const TodoItem({Key? key, required this.todo, required this.deleteFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(todo.description),
            IconButton(
              onPressed: () => deleteFunction(todo.id),
              icon: const Icon(
                Icons.remove_circle,
                color: Colors.black38,
              ),
              splashRadius: 20.00,
            ),
          ],
        ),
      ),
    );
  }
}


