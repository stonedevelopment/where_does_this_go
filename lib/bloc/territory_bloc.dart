import 'package:flutter/cupertino.dart';

class TerritoryBloc with ChangeNotifier {
  String _territory;

  String get territory => _territory;

  selectTerritory(String t) {
    _territory = t;
    notifyListeners();
  }
}
