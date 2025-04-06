class TimeSlot {
  final String time;
  bool isAvailable;

  TimeSlot({
    required this.time,
    this.isAvailable = true,
  });
}