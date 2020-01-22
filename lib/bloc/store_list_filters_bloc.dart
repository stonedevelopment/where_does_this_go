import 'package:flutter/cupertino.dart';

class StoreListFiltersBloc with ChangeNotifier {
  bool _filterShipToRep = true;

  bool get isFilteredByShipToRep => _filterShipToRep;

  filterShipToRep(bool filter) {
    _filterShipToRep = filter;
    notifyListeners();
  }
}
