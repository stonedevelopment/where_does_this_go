import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where_does_this_go/bloc/shipper_bloc.dart';
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

    //  TODO  Does not update after data was imported via website
    repository.query.onChildAdded.listen((Event event) {
      setState(() {
        _list.add(Shipper.fromSnapshot(event.snapshot));
      });
    });

    repository.query.onValue.listen((Event event) {
      print(event);
      print(event.snapshot);
      print(event.snapshot.key);
      print(event.snapshot.value);

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
        Provider.of<ShipperBloc>(context, listen: false).select(value);
      },
      hint: Text('Select a shipper from list'),
      value: Provider.of<ShipperBloc>(context).shipper,
    );
  }
}
