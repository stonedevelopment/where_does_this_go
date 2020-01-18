import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where_does_this_go/bloc/shipper_bloc.dart';
import 'package:where_does_this_go/model/shipper.dart';
import 'package:where_does_this_go/model/store.dart';
import 'package:where_does_this_go/repository/shipper_repository.dart';
import 'package:where_does_this_go/repository/store_repository.dart';

class StoreList extends StatefulWidget {
  @override
  _StoreListState createState() => _StoreListState();
}

class _StoreListState extends State<StoreList> {
  ShipperRepository repository = ShipperRepository();
  List<Store> _list;

  StreamSubscription<Event> _subscription;

  @override
  void initState() {
    super.initState();
    _list = List();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Shipper _shipper = Provider.of<ShipperBloc>(context).shipper;
    if (_shipper != null) {
//      _subscription = repository.ref
//          .child(_shipper.key)
//          .child('stores')
//          .onChildAdded
//          .listen((Event event) {
//        setState(() {
//          _list.add(Store.fromSnapshot(event.snapshot));
//        });
//      });

      _list = _shipper.stores.map((data) {
        return Store(data['Territory'], data['Store']);
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: _list.map((store) {
          return ListTile(
            title: Text(store.name),
          );
        }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
