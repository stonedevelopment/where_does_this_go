import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:where_does_this_go/model/shipper.dart';
import 'package:where_does_this_go/repository/shipper_repository.dart';

class ShipperDropdown extends StatefulWidget {
  @override
  _ShipperDropdownState createState() => _ShipperDropdownState();
}

class _ShipperDropdownState extends State<ShipperDropdown> {
  ShipperRepository repository = ShipperRepository();

  List<Shipper> _list;
  Shipper _value;

  @override
  void initState() {
    super.initState();
    _list = new List();
    repository.query.onChildAdded.listen((Event event) {
      setState(() {
        _list.add(Shipper.fromSnapshot(event.snapshot));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: _list.map((shipper) {
        return DropdownMenuItem(
          child: Text('${shipper.name} (${shipper.stores.length})'),
          value: shipper,
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _value = value;
        });
      },
      hint: Text('Select a shipper from list'),
      value: _value,
    );
  }
}
