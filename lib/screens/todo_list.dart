import 'package:blog_flutter_todo_list/screens/todo_form.dart';
import 'package:blog_flutter_todo_list/components/todo_item.dart';
import 'package:blog_flutter_todo_list/database/dao/todo_dao.dart';
import 'package:blog_flutter_todo_list/models/todo.dart';
import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final String _appBarTitle = 'ToDo List';
  final String _errorText = 'Error';
  final String _loadingText = 'Loading todos...';

  final TodoDao _dao = TodoDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.00),
            child: IconButton(
              onPressed: () => _navigateToForm(context),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              splashRadius: 20.00,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Todo>>(
        initialData: const [],
        future: _dao.getAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_loadingText),
                  ],
                ),
              );
              break;
            case ConnectionState.done:
              final List<Todo>? todos = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Todo todo = todos![index];
                  return TodoItem(
                    todo: todo,
                    deleteFunction: (id) {
                      _dao.delete(id).then((id) => {setState(() {})});
                    },
                  );
                },
                itemCount: todos!.length,
              );
              break;
          }
          return Text(_errorText);
        },
      ),
    );
  }

  void _navigateToForm(BuildContext context) {
    Navigator.of(context)
        .push(
          MaterialPageRoute(builder: (context) => TodoForm()),
        )
        .then((value) => setState(() {}));
  }
}


