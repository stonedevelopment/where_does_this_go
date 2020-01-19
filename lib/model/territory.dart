//  TODO: Make Territory MapEntry
class Territory {
  final String name;
  int total;

  Territory(this.name, this.total);

  increment() {
    this.total++;
  }
}