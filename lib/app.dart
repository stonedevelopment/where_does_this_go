import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where_does_this_go/bloc/shipper_bloc.dart';
import 'package:where_does_this_go/home_page.dart';

import 'model/shipper.dart';

class App extends StatelessWidget {
  String appTitle = 'Where Does This Go?';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ShipperBloc(),
        )
      ],
      child: Consumer<ShipperBloc>(
        builder: (BuildContext context, ShipperBloc bloc, Widget child) {
          return MaterialApp(
              title: appTitle,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: HomePage(title: appTitle));
        },
      ),
    );
  }
}
