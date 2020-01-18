import 'package:firebase_database/firebase_database.dart';
import 'package:where_does_this_go/repository/shipper_repository.dart';

class StoreRepository {
  static const String path = 'stores';
  final FirebaseDatabase database = FirebaseDatabase.instance;
  final ShipperRepository repository = ShipperRepository();

  final String key;

  StoreRepository(this.key);

  DatabaseReference get ref => repository.ref.child(key).child(path);
  Query get query => ref.orderByChild('Store');
}
