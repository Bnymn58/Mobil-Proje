import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbManager {
  Database _database;

  Future openDb() async {
    if (_database == null) {
      _database = await openDatabase(
          join(await getDatabasesPath(), "dtbase.db"),
          version:1, onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE bilgi(not_no INTEGER PRIMARY KEY autoincrement, baslik TEXT,not_yaz TEXT)",
        );

      });
    }
  }

  Future<int> insertBilgi(Bilgiler bilgiler) async {
    await openDb();
    return await _database.insert('bilgi', bilgiler.toMap());
  }

  Future<List<Bilgiler>>getBilgilerList() async{
    await openDb();
    final List<Map<String,dynamic>> maps=await _database.query('bilgi');
    return List.generate(maps.length, (i) {
      return Bilgiler(
        not_no: maps[i]['not_no'],
        baslik: maps[i]['baslik'],
        not_yaz: maps[i]['not_yaz'],
      );
    });
  }
  
  Future<int> updateBilgi(Bilgiler bilgiler) async{
    await openDb();
    return await _database.update(
        'bilgi',
        bilgiler.toMap(),
        where: "not_no=?",
        whereArgs:[bilgiler.not_no] );
  }

  Future<void>deleteBilgi(int not_no) async{
    await openDb();
    await _database.delete(
      'bilgi',
      where: "not_no=?",
      whereArgs: [not_no],
    );
  }

}

class Bilgiler {
   int not_no;
   String baslik;
   String not_yaz;

  Bilgiler({@required this.baslik,@required this.not_yaz, this.not_no});

  Map<String, dynamic> toMap() {
    return {
      'baslik': baslik,
      'not_yaz': not_yaz,
    };
  }
}
