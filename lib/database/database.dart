import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:boba_app/models/drink_item_model.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  //initialize the database
  initDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'drinks.db'),
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE drinks (
          id INTEGER PRIMARY KEY, name TEXT, source TEXT, price REAL, date TEXT, volume REAL
        )
      ''');
      },
      version: 1,
    );
  }

  //Insert drink item to the database; replace entirely if there's a conflict
  Future<void> insertDrink(DrinkItem drink) async {
    //get reference ot the database
    final db = await database;
    //convert drink item to a mapping before inserting it into the database
    await db.insert(
      'drinks',
      drink.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<DrinkItem>> getDrinks() async {
    //get reference to the database
    final Database db = await database;
    //Query the table for all the drinks
    final List<Map<String, dynamic>> maps = await db.query('drinks');

    //Convert the list of maps to a list of drinks
    return List.generate(maps.length, (index) {
      return DrinkItem(
        id: maps[index]['id'],
        name: maps[index]['name'],
        source: maps[index]['source'],
        price: maps[index]['price'],
        date: maps[index]['date'],
        volume: maps[index]['volume'],
      );
    });
  }

  Future<void> updateDrink(DrinkItem drink) async {
    //get refernce to the db
    final db = await database;

    //Update the given drink; note, modify the fields of existing drink
    //and pass in the result into this function
    await db.update(
      'drinks',
      drink.toMap(),
      //Ensure the id exists and matches
      where: "id = ?", //'?' serves as variable in SQL we specify in next line
      whereArgs: [drink.id],
    );
  }

  Future<void> deleteDrink(int id) async {
    //get reference to the db
    final db = await database;

    //remove drink from database via id
    await db.delete(
      'drinks',
      //use where clause to delete a specific drink
      where: "id = ?",
      //pass the id as whereArg to prevent a SQL injection
      whereArgs: [id],
    );

    print("drinkID: " + id.toString() + " was deleted");
  }

  printDrinks() async {
    List<DrinkItem> drinks = await getDrinks();

    for (DrinkItem drink in drinks) {
      print(drink.toString());
    }
  }
}
