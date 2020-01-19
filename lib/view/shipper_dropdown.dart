
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

    repository.query.onChildAdded.listen((event) {
      print('onChildAdded');
      setState(() {
        _list.add(Shipper.fromSnapshot(event.snapshot));
      });
    });

    repository.query.onChildChanged.listen((event) {
      print('onChildChanged');
      var old = _list.singleWhere((entry) {
        return entry.key == event.snapshot.key;
      });

      if (isOldShipperSelected(old)) {
        Provider.of<ShipperBloc>(context, listen: false).clearShipper();
      }

      setState(() {
        _list[_list.indexOf(old)] = Shipper.fromSnapshot(event.snapshot);
      });
    });
  }

  isOldShipperSelected(var oldShipper) {
    var blocShipper = Provider.of<ShipperBloc>(context, listen: false).shipper;
    return oldShipper == blocShipper;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton(
        items: buildList(),
        onChanged: (shipper) {
          Provider.of<ShipperBloc>(context, listen: false).selectShipper(shipper);
        },
        hint: Text('Select a shipper'),
        disabledHint: Text('There are no shippers to select.'),
        value: Provider.of<ShipperBloc>(context).shipper,
      ),
    );
  }

  buildList() {
    return _list.map((shipper) {
      return DropdownMenuItem(
        child: Text('${shipper.name} (${shipper.stores.length})'),
        value: shipper,
      );
    }).toList();
  }
}
