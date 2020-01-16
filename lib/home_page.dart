import 'package:flutter/material.dart';
import 'package:where_does_this_go/shipper_dropdown.dart';
import 'package:where_does_this_go/territory_dropdown.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[TerritoryDropdown(), ShipperDropdown()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Continue',
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}