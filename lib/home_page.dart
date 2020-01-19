import 'package:firebase_database/ui/firebase_sorted_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where_does_this_go/bloc/bloc.dart';
import 'package:where_does_this_go/model/shipper.dart';
import 'package:where_does_this_go/view/shipper_dropdown.dart';
import 'package:where_does_this_go/view/store_list.dart';
import 'package:where_does_this_go/view/territory_dropdown.dart';

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
          children: <Widget>[
            ShipperDropdown(),
            TerritoryDropdown(),
            StoreList(),
          ],
        ),
      ),
    );
  }
}
