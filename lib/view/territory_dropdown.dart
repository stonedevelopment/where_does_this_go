import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where_does_this_go/bloc/shipper_bloc.dart';
import 'package:where_does_this_go/bloc/territory_bloc.dart';
import 'package:where_does_this_go/model/shipper.dart';
import 'package:where_does_this_go/model/store.dart';

class TerritoryDropdown extends StatefulWidget {
  final String tag = 'TerritoryDropdown';

  @override
  _TerritoryDropdownState createState() => _TerritoryDropdownState();
}

class _TerritoryDropdownState extends State<TerritoryDropdown> {
  Shipper _shipper;
  String _territory;
  SplayTreeMap<String, int> _list;

  @override
  void initState() {
    super.initState();

    _list = SplayTreeMap();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    updateShipper(Provider.of<ShipperBloc>(context).shipper);
    updateTerritory(Provider.of<TerritoryBloc>(context).territory);
  }

  @override
  Widget build(BuildContext context) {
    if (_shipper == null) return Container();

    return DropdownButton(
      items: _list.keys.map((territory) {
        int total = _list[territory];
        return DropdownMenuItem(
          child: Text('$territory ($total)'),
          value: territory,
        );
      }).toList(),
      onChanged: (territory) {
        Provider.of<TerritoryBloc>(context, listen: false).selectTerritory(territory);
      },
      hint: Text('Select a territory'),
      value: Provider.of<TerritoryBloc>(context).territory,
    );
  }

  updateShipper(Shipper shipper) {
    if (_shipper == shipper) return;
    _shipper = shipper;

    Provider.of<TerritoryBloc>(context, listen: false).selectTerritory(null);
  }

  updateTerritory(String territory) {
    if (_territory == territory && _territory != null) return;
    _territory = territory;

    updateList();
  }

  updateList() {
    setState(() {
      _list.clear();
    });

    if (_shipper == null) return;

    SplayTreeMap<String, int> temp = SplayTreeMap();
    var length = _shipper.stores.length;
    for (var i = 0; i < length; i++) {
      var store = Store.fromValue(_shipper.stores[i]);
      var territory = store.territory;

      if (temp.containsKey(territory)) {
        temp.update(territory, (total) => ++total);
      } else
        temp.putIfAbsent(territory, () => 1);
    }

    setState(() {
      _list = temp;
    });
  }
}
