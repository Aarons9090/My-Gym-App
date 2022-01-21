import 'package:sqflite/sqflite.dart';

class LocalDatabse {

  openLocalDatabase() async {
    return await openDatabase('tietokantatiedosto.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('CREATE TABLE names (id SERIAL PRIMARY KEY, name TEXT NOT NULL);');
      }
    );
  }

  getNames() async {
    var tietokanta = await openLocalDatabase();
    var rivit = await tietokanta.rawQuery('SELECT * FROM names');
    await tietokanta.close();

    var nimet = [];
    for (var rivi in rivit) {
      nimet.add(rivi['name']);
    }

    return nimet;
  }

  addName(nimi) async {
    var tietokanta = await openLocalDatabase();
    await tietokanta.rawInsert('INSERT INTO names (name) VALUES (?)', [nimi]);
    await tietokanta.close();
  }

}