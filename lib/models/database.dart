import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'journal-entry.dart';

class JournalDatabase {
  final dbName;
  Database db;

  JournalDatabase({this.dbName});

  JournalDatabase.initDB({this.dbName}) {
    openDB();
  }

  Future<void> openDB() async {
    db = await openDatabase(dbName, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute( await rootBundle.loadString('assets/db-create.txt'));
    });
  }

  void insertDB(entry) async {
    await db.transaction((txn) async {
      await txn.rawInsert(
          await rootBundle.loadString('assets/db-insert.txt'),
          [entry.date, entry.title, entry.body, entry.rating]);
    });
  }

  Future<void> deleteTable() async {
    await deleteDatabase(dbName);
  }

  Future<List<JournalEntry>> orderedSelectDB() async {
    List<Map> results =
        await db.rawQuery(await rootBundle.loadString('assets/db-select.txt'));
    return results.map((entry) {
      return JournalEntry(
        id: entry['id'],
        date: entry['date'],
        title: entry['title'],
        body: entry['body'],
        rating: entry['rating'],
      );
    }).toList();
  }

  Future<void> deleteDB(int id) async {
    await db.transaction((txn) async {
      await txn.rawInsert(await rootBundle.loadString('assets/db-delete.txt'), [id]);
    });
  }

  Future<void> closeDB() async {
    await db.close();
  }
}
