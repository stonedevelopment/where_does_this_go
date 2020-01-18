import 'package:firebase_database/firebase_database.dart';

class Store {
  final String key;
  final String territory;
  final String name;

  Store(this.key, this.territory, this.name);

  Store.fromSnapshot(DataSnapshot snapshot) :
    key = snapshot.key,
    territory = snapshot.value["Territory"],
    name = snapshot.value["Store"];
}