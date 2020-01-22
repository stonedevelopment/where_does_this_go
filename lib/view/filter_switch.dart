import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where_does_this_go/bloc/shipper_bloc.dart';
import 'package:where_does_this_go/bloc/store_list_filters_bloc.dart';
import 'package:where_does_this_go/bloc/territory_bloc.dart';
import 'package:where_does_this_go/model/shipper.dart';

class FilterSwitch extends StatefulWidget {
  @override
  _FilterSwitchState createState() => _FilterSwitchState();
}

class _FilterSwitchState extends State<FilterSwitch> {
  Shipper _shipper;
  String _territory;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    updateShipper(Provider.of<ShipperBloc>(context).shipper);
    updateTerritory(Provider.of<TerritoryBloc>(context).territory);
  }

  @override
  Widget build(BuildContext context) {
    if (_shipper == null) return Container();
    if (_territory == null) return Container();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text('Show only \'Ship to Rep?\''),
          Switch(
            onChanged: (bool value) {
              Provider.of<StoreListFiltersBloc>(context, listen: false)
                  .filterShipToRep(value);
            },
            value: Provider.of<StoreListFiltersBloc>(context)
                .isFilteredByShipToRep,
          )
        ],
      ),
    );
  }

  updateShipper(Shipper shipper) {
    if (_shipper == shipper) return;

    setState(() {
      _shipper = shipper;
    });
  }

  updateTerritory(String territory) {
    if (_territory == territory) return;

    setState(() {
      _territory = territory;
    });
  }
}
