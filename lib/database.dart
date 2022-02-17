import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  openLocalDatabase() async {
    return await openDatabase('new15.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE cards (exerciseName TEXT PRIMARY KEY NOT NULL);');
      await db.execute(
          'CREATE TABLE repCards (exerciseName TEXT NOT NULL, reps TEXT NOT NULL, weight TEXT NOT NULL, date TEXT NOT NULL);');
    });
  }

  getCards() async {
    var db = await openLocalDatabase();
    var rows = await db.rawQuery('SELECT * FROM cards');
    //await db.close();
    
    Map<String, List<Map<String, String>>> cards = {};
    List<Map<String, String>> repCards = [];

    for (var rivi in rows) {
      repCards = await getRepsCards(rivi["exerciseName"]);
      cards[rivi["exerciseName"]] = repCards;
    }

    return cards;
  }

  getRepsCards(String name) async {
    var db = await openLocalDatabase();
    var rows = await db
        .rawQuery('SELECT * FROM repCards WHERE exerciseName=?', [name]);

    List<Map<String, String>> repCards = [];

    for (var rivi in rows) {
      repCards.add({
        "exerciseName": rivi["exerciseName"],
        "reps": rivi["reps"],
        "weight": rivi["weight"],
        "date": rivi["date"]
      });
    }
    return repCards;
  }

  addExercise(name) async {
    var db = await openLocalDatabase();
    await db.rawInsert('INSERT INTO cards VALUES (?)', [name]);
    //await db.close();
  }

  addRep(String cardName, String reps, String weight, String date) async {
    var db = await openLocalDatabase();
    await db.rawUpdate(
        'INSERT INTO repCards (exerciseName, reps, weight, date) VALUES (?,?,?,?)',
        [cardName, reps, weight, date]);
    //await db.close();
  }

  deleteExercise(name) async {
    var db = await openLocalDatabase();
    await db.rawDelete("DELETE FROM cards WHERE exerciseName = ?", [name]);
    await db.rawDelete("DELETE FROM repCards WHERE exerciseName = ?", [name]);
    //await db.close();
  }

    deleteRepCard(name, reps, weight, date) async {
    var db = await openLocalDatabase();
    await db.rawDelete("DELETE FROM repCards WHERE exerciseName = ? and reps=? and weight=? and date=?", [name, reps, weight, date]);
    //await db.close();
  }
}
