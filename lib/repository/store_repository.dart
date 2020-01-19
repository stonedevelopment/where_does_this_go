import 'package:firebase_database/firebase_database.dart';
import 'package:where_does_this_go/repository/shipper_repository.dart';

class StoreRepository {
  static const String path = 'stores';
  static const String name = 'name';

  final ShipperRepository repository = ShipperRepository();

  Query getStoresByShipper(String key) {
    return repository.ref.child(key).child(path).orderByChild(name);
  }

  Query getStoresByTerritory(String key, String territory) {
    return repository.ref.child(key).child(path).equalTo(territory).orderByChild(name);
  }
}
