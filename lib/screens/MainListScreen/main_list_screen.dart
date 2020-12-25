import 'package:flutter/material.dart';
import 'package:boba_app/constants.dart';

class MainListScreen extends StatefulWidget {
  @override
  _MainListScreenState createState() => _MainListScreenState();
}

class _MainListScreenState extends State<MainListScreen> {
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
      body: Container(
        child: Text("drinks list section")
      ),
    );
  }
}
