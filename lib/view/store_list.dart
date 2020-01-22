import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where_does_this_go/bloc/shipper_bloc.dart';
import 'package:where_does_this_go/bloc/store_list_filters_bloc.dart';
import 'package:where_does_this_go/bloc/territory_bloc.dart';
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
  bool _filterShipToRep;

  @override
  void initState() {
    super.initState();
    _list = List();
    _filterShipToRep = Provider.of<StoreListFiltersBloc>(context, listen: false)
        .isFilteredByShipToRep;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    updateShipper(Provider.of<ShipperBloc>(context).shipper);
    updateTerritory(Provider.of<TerritoryBloc>(context).territory);
    updateFilter(
        Provider.of<StoreListFiltersBloc>(context).isFilteredByShipToRep);
  }

  @override
  Widget build(BuildContext context) {
    if (_shipper == null) return Container();
    if (_territory == null) return Container();

    return Expanded(
      child: _list.length > 0 ? buildListView() : buildTextView(),
    );
  }

  updateShipper(Shipper shipper) {
    if (_shipper == shipper) return;

    _shipper = shipper;
  }

  updateTerritory(String territory) {
    if (_territory == territory) return;

    _territory = territory;
    updateList();
  }

  updateFilter(bool filter) {
    if (_filterShipToRep == filter) return;

    _filterShipToRep = filter;
    updateList();
  }

  buildTextView() {
    return Center(
      child: Text('There are no stores available.'),
    );
  }

  buildListView() {
    return ListView(
        children: _list.map((store) {
      return ListTile(
        title: Text(store.name),
        subtitle: Text(store.buildAddress()),
      );
    }).toList());
  }

  updateList() {
    setState(() {
      _list.clear();
    });

    if (_shipper == null) return;
    if (_territory == null) return;

    List<Store> temp = List();
    var length = _shipper.stores.length;
    for (var i = 0; i < length; i++) {
      Store store = Store.fromValue(_shipper.stores[i]);

      if (isFilteredByShipToRep) {
        if (store.isShipToStore()) continue;
      }

      if (store.territory != _territory) continue;

      temp.add(store);
    }

    temp.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    setState(() {
      _list = temp;
    });
  }

  bool get isFilteredByShipToRep => _filterShipToRep;
}
