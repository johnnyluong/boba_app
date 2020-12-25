import 'dart:async';

import 'package:boba_app/components/list_item.dart';
import 'package:boba_app/database/database.dart';
import 'package:boba_app/models/drink_item_model.dart';
import 'package:flutter/material.dart';

class MainList extends StatefulWidget {
  @override
  _MainListState createState() => _MainListState();
}

class _MainListState extends State<MainList> {
  Future<List<DrinkItem>> _drinks;

  @override
  void initState() {
    super.initState();
    _drinks = DBProvider.db.getDrinks();
  }

  @override
  Widget build(BuildContext context) {
    final _drinksController = StreamController<List<DrinkItem>>.broadcast();
    var drinksStream = _drinksController.stream;

    // int length;

    // if (drinks == null) {
    //   length = 0;
    // } else {
    //   length = drinks.length;
    // }

    // if (length == 0) {
    //   return Container(
    //     alignment: Alignment.center,
    //     child: Text(
    //       "You do not have any contacts yet.",
    //       textAlign: TextAlign.center,
    //       style: TextStyle(color: lightTextcolor),
    //     ),
    //   );
    // } else {
    return FutureBuilder(
      future: _drinks,
      builder: (_, drinksData) {
        if (drinksData.data != null) {
          return ListView.builder(
            itemCount: drinksData.data.length,
            itemBuilder: (context, index) {
              return ListItem(
                drink: drinksData.data[index],
              );
            },
            //separatorBuilder: (BuildContext context, int index) => const Divider(),
          );
        } else {
          return Text("no drinks");
        }
      },
    );
    //}
  }
}
