import 'package:boba_app/constants.dart';
import 'package:boba_app/database/database.dart';
import 'package:boba_app/models/drink_item_model.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final DrinkItem drink;

  const ListItem({Key key, this.drink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Return a card item containing relevant data
    return ListTile(
      title: Text(
        drink.name,
        style: TextStyle(
          fontSize: 16,
          color: primaryColor,
        ),
      ),
      subtitle: Text(
        drink.source,
        style: TextStyle(
          fontSize: 12,
        ),
      ),
      contentPadding: EdgeInsets.fromLTRB(20.0, 7.5, 20.0, 0.0),
      dense: true,
      visualDensity: VisualDensity.compact,
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: secondaryColor,
        child: IconButton(
          icon: Icon(
            Icons.local_cafe,
            color: primaryColor,
            size: 21,
          ),
          onPressed: () {},
        ),
      ),
      trailing: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 16,
          items:
              <String>['Delete'].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            DBProvider.db.deleteDrink(drink.id);
          },
        ),
      ),
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        // builder: (context) => ViewDrinkScreen( //TODO
        //   drink: drink,
        //     ),
        //   ),
      },
    );
  }
}
