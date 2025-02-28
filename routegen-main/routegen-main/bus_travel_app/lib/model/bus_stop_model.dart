class BusStop {
  final String name;

  BusStop({required this.name});

  @override
  String toString() => name;
}

class Schedule{
  final int departureHour;
  final int departureMinute;
  final String stop;

  Schedule({
    required this.departureHour,
    required this.departureMinute,
    required this.stop
  });

  Map<String, dynamic> toMap(){
    return {
      'departureHour' : departureHour,
      'departureMinute' : departureMinute,
      'stopName' : stop
    };
  }
}