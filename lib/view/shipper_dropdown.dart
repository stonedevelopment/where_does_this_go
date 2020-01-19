import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where_does_this_go/bloc/bloc.dart';
import 'package:where_does_this_go/model/shipper.dart';
import 'package:where_does_this_go/repository/shipper_repository.dart';

class ShipperDropdown extends StatefulWidget {
  @override
  _ShipperDropdownState createState() => _ShipperDropdownState();
}

class _ShipperDropdownState extends State<ShipperDropdown> {
  ShipperRepository repository = ShipperRepository();

  List<Shipper> _list;

  @override
  void initState() {
    super.initState();
    _list = List();

    repository.query.onChildAdded.listen((event) {
      print('onChildAdded');
      print(event);
      DataSnapshot snapshot = event.snapshot;

      setState(() {
        _list.add(Shipper.fromSnapshot(event.snapshot));
      });
    });

    repository.query.onChildChanged.listen((event) {
      print('onChildChanged');
      print(event);
      DataSnapshot snapshot = event.snapshot;
    });

    repository.query.onChildMoved.listen((event) {
      print('onChildMoved');
      print(event);
      DataSnapshot snapshot = event.snapshot;
    });

    repository.query.onChildRemoved.listen((event) {
      print('onChildRemoved');
      print(event);
      DataSnapshot snapshot = event.snapshot;
    });

    repository.query.onValue.listen((event) {
      print('onValue');
      print(event);
      DataSnapshot snapshot = event.snapshot;
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
        Provider.of<Bloc>(context, listen: false).selectShipper(value);
      },
      hint: Text('Select a shipper from list'),
      value: Provider.of<Bloc>(context).shipper,
    );
  }
}
