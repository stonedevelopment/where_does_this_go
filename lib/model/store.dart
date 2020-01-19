class Store {
  static const String Name = 'Store';
  static const String Territory = 'Territory';
  static const String Address = 'Address';
  static const String City = 'City';
  static const String State = 'State';

  final String _name;
  final String _territory;
  final String _address;
  final String _city;
  final String _state;

  Store(this._name, this._territory, this._address, this._city, this._state);

  Store.fromValue(var value)
      : this._name = value[Name],
        this._territory = value[Territory],
        this._address = value[Address],
        this._city = value[City],
        this._state = value[State];

  String get name => _name;

  String get territory => _territory;

  String get address => _address;

  String get city => _city;

  String get state => _state;

  buildAddress() {
    return '$address, $city, $state';
  }

  @override
  String toString() {
    return 'Store.toString() {\n'
        '    name: $name\n'
        '    territory: $territory\n'
        '    address: $address\n'
        '    city: $city\n'
        '    state: $state\n'
        '}';
  }
}
