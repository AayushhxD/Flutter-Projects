import 'dart:developer';

int calculateFare(Map<String, dynamic> fareData, int startStop, int endStop) {
  int totalFare = 0;
  
  for (int i = startStop; i < endStop; i++) {
    String key = '${i}_${i + 1}';
    if (fareData.containsKey(key)) {
      totalFare += fareData[key] as int;
      log("total fare : $totalFare");
    } else {
      throw Exception('Fare data not found for stop $i to ${i + 1}');
    }
  }
  log("Start Stop : $startStop");
  log("end stop : $endStop");
  log("calculated fare : $totalFare");
  return totalFare;
}