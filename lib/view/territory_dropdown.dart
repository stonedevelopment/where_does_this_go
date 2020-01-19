import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where_does_this_go/bloc/bloc.dart';
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

    updateShipper(Provider.of<Bloc>(context).shipper);
    updateTerritory(Provider.of<Bloc>(context).territory);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: _list.keys.map((territory) {
        int total = _list[territory];
        return DropdownMenuItem(
          child: Text('$territory ($total)'),
          value: territory,
        );
      }).toList(),
      onChanged: (territory) {
        Provider.of<Bloc>(context, listen: false).selectTerritory(territory);
      },
      hint: Text('Select a territory from the list'),
      value: Provider.of<Bloc>(context).territory,
    );
  }

  updateShipper(Shipper shipper) {
    print('${widget.tag} updateShipper(): $shipper');
    if (_shipper == shipper) return;
    _shipper = shipper;

    Provider.of<Bloc>(context, listen: false).selectTerritory(null);
  }

  updateTerritory(String territory) {
    print('${widget.tag} updateTerritory(): $territory vs $_territory');
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
