import 'package:firebase_database/firebase_database.dart';
import 'package:where_does_this_go/model/store.dart';

class Shipper {
  static const String NAME = 'name';
  static const String STORES = 'stores';

  final String _key;
  final String _name;
  final List _stores;

  Shipper(this._key, this._name, this._stores);

  String get key => _key;

  String get name => _name;

  List get stores => _stores;

  Shipper.fromSnapshot(DataSnapshot snapshot)
      : _key = snapshot.key,
        _name = snapshot.value[NAME],
        _stores = snapshot.value[STORES];

  @override
  String toString() {
    return 'Shipper.toString() {\n'
        '    key: $key\n'
        '    name: $name\n'
        '    stores: $stores\n'
        '}';
  }

  static indexOf(Shipper old) {}
}
