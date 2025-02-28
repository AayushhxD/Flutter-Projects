import 'dart:developer';

class BusTimeCalculator {
  // Map to store bus schedules with their remaining time
  Map<String, Map<String, int>> getRemainingTime(List<String> scheduledTimes) {
    final now = DateTime.now();
    final Map<String, Map<String, int>> remainingTimes = {};

    for (String scheduleTime in scheduledTimes) {
      // Parse the scheduled time
      final List<String> timeParts = scheduleTime.split(':');
      final int scheduleHour = int.parse(timeParts[0]);
      final int scheduleMinute = int.parse(timeParts[1]);

      // Create scheduled datetime for today
      final scheduledTime = DateTime(
        now.year,
        now.month,
        now.day,
        scheduleHour,
        scheduleMinute,
      );

      // If scheduled time is earlier than current time, add 24 hours
      // if (scheduledTime.isBefore(now)) {
      //   scheduledTime.add(const Duration(days: 1));
      // }

      // Calculate difference
      final difference = scheduledTime.difference(now);

      // Convert to hours and minutes
      final hours = difference.inHours;
      final minutes = difference.inMinutes % 60;

      // Store in map
      remainingTimes[scheduleTime] = {
        'hours': hours,
        'minutes': minutes,
      };
    }

    log('$remainingTimes');
    return remainingTimes;
  }

  // Get nearest bus time
  Map<String, dynamic> getNearestBusTime(List<String> scheduledTimes) {
    final remainingTimes = getRemainingTime(scheduledTimes);
    String nearestTime = scheduledTimes[0];
    int minTotalMinutes = double.infinity.toInt();

    remainingTimes.forEach((time, remaining) {
      final totalMinutes = remaining['hours']! * 60 + remaining['minutes']!;
      if (totalMinutes < minTotalMinutes && totalMinutes >= 0) {
        minTotalMinutes = totalMinutes;
        nearestTime = time;
      }
    });

    return {
      'scheduledTime': nearestTime,
      'remainingTime': remainingTimes[nearestTime]!,
    };
  }

  // Format remaining time as string
  String formatRemainingTime(Map<String, int> remainingTime) {
    final hours = remainingTime['hours'];
    final minutes = remainingTime['minutes'];
    
    if (hours == 0) {
      return '00 : $minutes';
    } else if (minutes == 0) {
      return '$hours : 00';
    } else {
      return '$hours : $minutes';
    }
  }
}