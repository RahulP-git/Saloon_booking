import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/flutter_provider.dart';
  // Import the provider

class BookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
        appBar: AppBar(title: Text("Booking App")),
        body: TimeSlotList(),
    );
  }
}

class TimeSlotList extends StatelessWidget {
  bool _isSelecte=false;

  @override
  Widget build(BuildContext context) {

    return
      Consumer<TimeSlotProvider>(
      builder: (context, provider, child) {
        return
         GridView.builder(gridDelegate:
         SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,
         mainAxisSpacing: 10,
         crossAxisSpacing: 10),
          itemCount: provider.timeSlots.length,
         itemBuilder: (context, index) {
            final timeSlot = provider.timeSlots[index];
             return
               InkWell(
                 onTap:
                     (){
                   provider.toggleAvailability(timeSlot.time);  // Toggle availability
                   final status = timeSlot.isAvailable ? 'booked' : 'available';
                   ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content: Text('This slot is now $status!')
                     ),
                   );
                 },
                 child:
                 Material(
                   elevation: 10,
                   child: Container(
                     alignment: Alignment.center,
                     color: Colors.white54,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Text(timeSlot.time,style: TextStyle(
                         fontWeight: FontWeight.bold
                       ),
                       ),
                       Icon(
                         timeSlot.isAvailable ? Icons.check_circle : Icons.remove_circle,
                         color: timeSlot.isAvailable ? Colors.green : Colors.red,
                       ),
                     ],
                   ),
                   )
                 )
               );
           },
         );
      },
    );
  }
}
