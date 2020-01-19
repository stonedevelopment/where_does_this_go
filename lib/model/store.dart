import 'package:firebase_database/firebase_database.dart';

class Store {
  static const String NAME = 'Store';
  static const String TERRITORY = 'Territory';

  final String _name;
  final String _territory;

  Store(this._name, this._territory);

  String get name => _name;

  String get territory => _territory;

  Store.fromValue(var value)
      : this._name = value[NAME],
        this._territory = value[TERRITORY];

  @override
  String toString() {
    return 'Store.toString() {\n'
        '    name: $name\n'
        '    territory: $territory\n'
        '}';
  }
}
