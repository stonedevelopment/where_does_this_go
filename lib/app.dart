import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where_does_this_go/bloc/shipper_bloc.dart';
import 'package:where_does_this_go/bloc/store_list_filters_bloc.dart';
import 'package:where_does_this_go/bloc/territory_bloc.dart';
import 'package:where_does_this_go/home_page.dart';

class App extends StatelessWidget {
  String appTitle = 'Where Does This Go?';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => StoreListFiltersBloc(),
        ),
        ChangeNotifierProvider(
          create: (_) => ShipperBloc(),
        ),
        ChangeNotifierProvider(
          create: (_) => TerritoryBloc(),
        )
      ],
      child: MaterialApp(
          title: appTitle,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage(title: appTitle)),
    );
  }
}
