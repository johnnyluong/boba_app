import 'package:boba_app/database/database.dart';
import 'package:boba_app/models/drink_item_model.dart';
import 'package:flutter/material.dart';
import 'package:boba_app/constants.dart';

class MainListScreen extends StatefulWidget {
  @override
  _MainListScreenState createState() => _MainListScreenState();
}

class _MainListScreenState extends State<MainListScreen> {
  int _currentID = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text(
          'boba drinks',
          style: TextStyle(color: lightTextcolor),
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            color: addItemButtonColor,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          FlatButton(
            child: Text('add drink'),
            color: Colors.black,
            textColor: Colors.white,
            onPressed: () {
              var drink = DrinkItem(
                id: _currentID,
                name: 'milk tea',
                source: 'nest',
                price: 3.50,
                date: 'today',
                volume: 12.0,
              );
              setState(() {
                _currentID++;
              });
              DBProvider.db.insertDrink(drink);
            },
          ),
          FlatButton(
            child: Text('prink drinks db'),
            color: Colors.black,
            textColor: Colors.white,
            onPressed: () async {
              await DBProvider.db.printDrinks();
            },
          ),
        ],
      ),
    );
  }
}
