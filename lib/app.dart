import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:where_does_this_go/bloc/shipper_bloc.dart';
import 'package:where_does_this_go/bloc/store_list_filters_bloc.dart';
import 'package:where_does_this_go/bloc/territory_bloc.dart';
import 'package:where_does_this_go/home_page.dart';

class App extends StatelessWidget {
  final String appTitle = 'Where Does This Go?';

  Map<int, Color> _primarySwatch = {
    50: Color.fromRGBO(142, 68, 50, .1),
    100: Color.fromRGBO(142, 68, 50, .2),
    200: Color.fromRGBO(142, 68, 50, .3),
    300: Color.fromRGBO(142, 68, 50, .4),
    400: Color.fromRGBO(142, 68, 50, .5),
    500: Color.fromRGBO(142, 68, 50, .6),
    600: Color.fromRGBO(142, 68, 50, .7),
    700: Color.fromRGBO(142, 68, 50, .8),
    800: Color.fromRGBO(142, 68, 50, .9),
    900: Color.fromRGBO(142, 68, 50, 1),
  };

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
                  primarySwatch: MaterialColor(0xFF8e4432, _primarySwatch),
                  backgroundColor: Color(0xFF8b8a7e)),
          home: HomePage(title: appTitle)),
    );
  }
}
