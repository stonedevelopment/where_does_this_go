import 'package:flutter/material.dart';

class TerritoryDropdown extends StatefulWidget {
  @override
  _TerritoryDropdownState createState() => _TerritoryDropdownState();
}

class _TerritoryDropdownState extends State<TerritoryDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: <DropdownMenuItem>[],
      onChanged: (value) {},
    );
  }
}
