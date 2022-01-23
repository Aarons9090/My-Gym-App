import 'package:sqflite/sqflite.dart';

class LocalDatabase {

  openLocalDatabase() async {
    return await openDatabase('tietokantatiedosto.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('CREATE TABLE names (id SERIAL PRIMARY KEY, name TEXT NOT NULL);');
      }
    );
  }

  getNames() async {
    var db = await openLocalDatabase();
    var rows = await db.rawQuery('SELECT * FROM names');
    await db.close();

    var nimet = [];
    for (var rivi in rows) {
      nimet.add(rivi['name']);
    }

    return nimet;
  }

  addName(nimi) async {
    var db = await openLocalDatabase();
    await db.rawInsert('INSERT INTO names (name) VALUES (?)', [nimi]);
    await db.close();
    
  }

  deleteName(nimi) async {
    var db = await openLocalDatabase();
    await db.rawDelete("DELETE FROM names WHERE name = ?", [nimi]);
    await db.close();
  }
}