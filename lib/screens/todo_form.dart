import 'package:blog_flutter_todo_list/components/Editor.dart';
import 'package:blog_flutter_todo_list/database/dao/todo_dao.dart';
import 'package:blog_flutter_todo_list/models/todo.dart';
import 'package:flutter/material.dart';

class TodoForm extends StatefulWidget {
  TodoForm({Key? key}) : super(key: key);

  final TextEditingController _descriptionController = TextEditingController();

  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final TodoDao _dao = TodoDao();

  final String _appBarTitle = 'ToDo Form';
  final String _descriptionEditorLabel = 'Description';
  final String _saveButtonLabel = 'Save';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Editor(
              controller: widget._descriptionController,
              keyboardType: TextInputType.text,
              label: _descriptionEditorLabel,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.00),
              child: SizedBox(
                width: double.maxFinite,
                height: 40.00,
                child: ElevatedButton(
                  onPressed: () {
                    final String description =
                        widget._descriptionController.text;

                    if (description != null) {
                      final Todo newTodo = Todo(0, description);

                      _dao.save(newTodo).then((id) => Navigator.pop(context));
                    }
                  },
                  child: Text(_saveButtonLabel),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}










