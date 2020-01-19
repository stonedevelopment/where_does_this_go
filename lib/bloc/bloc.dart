import 'package:flutter/cupertino.dart';
import 'package:where_does_this_go/model/shipper.dart';

class Bloc with ChangeNotifier {
  Shipper _shipper;
  String _territory;

  Shipper get shipper => _shipper;

  String get territory => _territory;

  clearShipper() {
    selectShipper(null);
  }

  selectShipper(Shipper s) {
    _shipper = s;
    notifyListeners();
  }

  selectTerritory(String t) {
    _territory = t;
    notifyListeners();
  }
}
