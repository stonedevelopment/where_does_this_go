import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where_does_this_go/bloc/bloc.dart';
import 'package:where_does_this_go/model/shipper.dart';
import 'package:where_does_this_go/model/store.dart';

class StoreList extends StatefulWidget {
  final String tag = 'StoreList';

  @override
  _StoreListState createState() => _StoreListState();
}

class _StoreListState extends State<StoreList> {
  List<Store> _list;
  Shipper _shipper;
  String _territory;

  @override
  void initState() {
    super.initState();
    _list = List();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    updateShipper(Provider.of<Bloc>(context).shipper);
    updateTerritory(Provider.of<Bloc>(context).territory);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: buildList(),
      ),
    );
  }

  updateShipper(Shipper shipper) {
    if (_shipper == shipper && _shipper != null) return;

    _shipper = shipper;
  }

  updateTerritory(String territory) {
    print('${widget.tag} updateTerritory(): $territory');
    if (_territory == territory && _territory != null) return;

    _territory = territory;
    updateList();
  }

  buildList() {
    print('buildList()');
    return _list.map((store) {
      return ListTile(
        title: Text(store.name),
      );
    }).toList();
  }

  updateList() {
    print('${widget.tag} updateList()');

    setState(() {
      _list.clear();
    });

    if (_shipper == null) return;
    if (_territory == null) return;

    List<Store> temp = List();
    var length = _shipper.stores.length;
    for (var i = 0; i < length; i++) {
      Store store = Store.fromValue(_shipper.stores[i]);
      if (isFilteredByTerritory) {
        if (store.territory == _territory) {
          temp.add(store);
        }
      } else {
        temp.add(store);
      }
    }

    setState(() {
      _list = temp;
    });
  }

  bool get isFilteredByTerritory => _territory != null;
}
