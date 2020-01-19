import 'package:firebase_database/firebase_database.dart';
import 'package:where_does_this_go/model/shipper.dart';

class ShipperRepository {
  static const String path = 'shippers';

  final FirebaseDatabase database = FirebaseDatabase.instance;

  DatabaseReference get ref => database.reference().child(path);

  Query get query => ref.orderByChild('name');
}
