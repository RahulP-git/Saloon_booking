import 'package:flutter/material.dart';
import 'package:salonapp/services/timeslote.dart';
 // Your time slot model

class TimeSlotProvider with ChangeNotifier {
  List<TimeSlot> _timeSlots = [
    TimeSlot(time: '9:00 AM'),
    TimeSlot(time: '9:30 AM'),
    TimeSlot(time: '10:00 AM'),
    TimeSlot(time: '10:30 AM'),
    TimeSlot(time: '11:00 AM'),
    TimeSlot(time: '11:30 AM'),
    TimeSlot(time: '12:00 PM'),
    TimeSlot(time: '12:30 PM'),
    TimeSlot(time: '1:00 PM'),
    TimeSlot(time: '1:30 PM'),
    TimeSlot(time: '3:30 PM'),
    TimeSlot(time: '4:00 PM'),
    TimeSlot(time: '4:30 PM'),
    TimeSlot(time: '5:00 PM'),
    TimeSlot(time: '5:30 PM'),
    TimeSlot(time: '6:00 PM'),
    TimeSlot(time: '6:30 PM'),
    TimeSlot(time: '7:00 PM'),
    TimeSlot(time: '7:30 PM'),
    TimeSlot(time: '8:00 PM'),
    TimeSlot(time: '8:30 PM'),
    TimeSlot(time: '9:00 PM'),
    TimeSlot(time: '9:30 PM'),
    TimeSlot(time: '10:00 PM'),
  ];

  List<TimeSlot> get timeSlots => _timeSlots;

  void toggleAvailability(String time) {
    final slot = _timeSlots.firstWhere((slot) => slot.time == time);
    slot.isAvailable = !slot.isAvailable;
    notifyListeners();  // Notify listeners when the availability changes
  }

  // Simulate getting data from an API or backend
  Future<void> fetchTimeSlots() async {
    await Future.delayed(Duration(seconds: 2));  // Simulate a network delay
    notifyListeners();  // Notify listeners after fetching the data
  }
}
