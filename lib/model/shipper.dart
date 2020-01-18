import 'package:firebase_database/firebase_database.dart';
import 'package:where_does_this_go/model/store.dart';

class Shipper {
  final String key;
  final String name;
  final List<dynamic> stores;

  Shipper(this.key, this.name, this.stores);

  Shipper.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        name = snapshot.value['name'],
        stores = snapshot.value['stores'];

  @override
  String toString() {
    return 'key: $key\n'
        'name: $name\n'
        'stores: $stores';
  }
}
