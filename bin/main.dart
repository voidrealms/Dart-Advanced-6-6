import 'dart:io';

import 'package:sqljocky5/connection/connection.dart';
import 'package:sqljocky5/sqljocky.dart';

final settings = ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'bryan',
    password: 'password',
    db: 'school',
);

main(List<String> arguments) async {

  final conn = await MySqlConnection.connect(settings);

  var query = await conn.prepare('insert into students (name) values (?)');
  await insert(query, 'Marc');
  await insert(query, 'Chad');
  await insert(query, 'Stacy');
  await insert(query, 'Peter');

  conn.close();
  exit(0);

}

void insert(Prepared query, String name) async {
  var result = await query.execute([name]);
  print('New student ID: ${result.insertId}');
}

