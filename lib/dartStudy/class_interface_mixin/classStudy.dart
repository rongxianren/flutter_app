class Bicycle {
  int cadence;
  int _speed;
  int gear;

  int get speed => _speed;

  Bicycle(this.cadence, this.gear, int speed) {
    _speed = speed;
  }

  @override
  String toString() {
    return 'cadence = $cadence  speed = $_speed  gear = $gear';
  }
}

void main() {
  var bicycle = Bicycle(100, 10, 23);
  print(bicycle.toString());
  print('bicycle.speed = ${bicycle._speed}');
}
