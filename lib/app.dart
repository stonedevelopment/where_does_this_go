import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where_does_this_go/bloc/bloc.dart';
import 'package:where_does_this_go/home_page.dart';

import 'model/shipper.dart';

class App extends StatelessWidget {
  String appTitle = 'Where Does This Go?';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Bloc(),
        )
      ],
      child: Consumer<Bloc>(
        builder: (BuildContext context, Bloc bloc, Widget child) {
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
