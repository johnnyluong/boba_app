import 'package:flutter/material.dart';
import 'package:boba_app/constants.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text(
          'settings',
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
      body: Container(
        child: Text("drinks list section")
      ),
    );
  }
}