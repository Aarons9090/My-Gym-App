import "package:flutter/material.dart";
import 'package:gym_app/main.dart';
import 'package:sqflite/sqflite.dart';


class Tietokanta {

  avaaTietokanta() async {
    return await openDatabase('tietokantatiedosto.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('CREATE TABLE names (id SERIAL PRIMARY KEY, name TEXT NOT NULL);');
      }
    );
  }

  haeNimet() async {
    var tietokanta = await avaaTietokanta();
    var rivit = await tietokanta.rawQuery('SELECT * FROM names');
    await tietokanta.close();

    var nimet = [];
    for (var rivi in rivit) {
      nimet.add(rivi['name']);
    }

    return nimet;
  }

  lisaaNimi(nimi) async {
    var tietokanta = await avaaTietokanta();
    await tietokanta.rawInsert('INSERT INTO names (name) VALUES (?)', [nimi]);
    await tietokanta.close();
  }

}