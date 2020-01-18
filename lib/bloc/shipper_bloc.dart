import 'package:flutter/cupertino.dart';
import 'package:where_does_this_go/model/shipper.dart';

class ShipperEvent {}

class ShipperBloc with ChangeNotifier {
  Shipper _shipper;

  Shipper get shipper => _shipper;

  void select(Shipper s) {
    _shipper = s;
    notifyListeners();
  }
}
