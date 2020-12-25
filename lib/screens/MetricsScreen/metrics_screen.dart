import 'package:flutter/material.dart';
import 'package:boba_app/constants.dart';

class MetricsScreen extends StatefulWidget {
  @override
  _MetricsScreenState createState() => _MetricsScreenState();
}

class _MetricsScreenState extends State<MetricsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text(
          'metrics',
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
        child: Text("metrics section")
      ),
    );
  }
}