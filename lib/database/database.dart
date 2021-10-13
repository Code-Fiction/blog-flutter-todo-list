import 'package:blog_flutter_todo_list/database/dao/todo_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  final String path = join(await getDatabasesPath(), 'todos.db');

  return openDatabase(
    path,
    onCreate: (database, version) {
      database.execute(TodoDao.createTableSql);
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}


