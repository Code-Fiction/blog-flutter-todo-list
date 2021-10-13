import 'package:blog_flutter_todo_list/database/database.dart';
import 'package:blog_flutter_todo_list/models/todo.dart';
import 'package:sqflite/sqflite.dart';

class TodoDao {
  static const String _tableName = 'todos';
  static const String _id = 'id';
  static const String _description = 'description';

  static const String createTableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_description TEXT)';

  Future<int> save(Todo todo) async {
    final Database database = await createDatabase();

    Map<String, dynamic> todoMap = _toMap(todo);

    return database.insert(_tableName, todoMap);
  }

  Future<int> delete(int id) async {
    final Database database = await createDatabase();

    return database.delete(
      _tableName,
      where: '$_id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Todo>> getAll() async {
    final Database database = await createDatabase();

    final List<Map<String, dynamic>> allResults =
        await database.query(_tableName);

    List<Todo> todos = _toList(allResults);

    return todos;
  }

  Map<String, dynamic> _toMap(Todo todo) {
    final Map<String, dynamic> todoMap = Map();
    todoMap[_description] = todo.description;
    return todoMap;
  }

  List<Todo> _toList(List<Map<String, dynamic>> result) {
    final List<Todo> todos = [];

    for (Map<String, dynamic> row in result) {
      final Todo todo = Todo(
        row[_id],
        row[_description],
      );

      todos.add(todo);
    }
    return todos;
  }
}
