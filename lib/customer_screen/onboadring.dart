import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyBookingScreen extends StatelessWidget {
  final CollectionReference bookings =
  FirebaseFirestore.instance.collection('UserBooking');

  Future<void> updateBookingStatus(
      String bookingId, String status, String reason) async {
    await bookings.doc(bookingId).update({
      'approvalStatus': status,
      'reason': reason,
    });
  }

  Future<void> showReasonDialog(BuildContext context, String bookingId, String status) {
    TextEditingController reasonController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Enter Reason for $status'),
        content: TextField(
          controller: reasonController,
          decoration: InputDecoration(hintText: 'Reason'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              String reason = reasonController.text.trim();
              if (reason.isNotEmpty) {
                updateBookingStatus(bookingId, status, reason);
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please enter a reason')),
                );
              }
            },
            child: Text('Confirm'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Customer Bookings')),
      body: StreamBuilder<QuerySnapshot>(
        stream: bookings.where('approvalStatus', isEqualTo: 'pending').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No pending bookings.'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var booking = snapshot.data!.docs[index];
              return ListTile(
                title: Text(booking['UserName']),
                subtitle: Text('Booking Date: ${booking['Date']}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.check, color: Colors.green),
                      onPressed: () =>
                          showReasonDialog(context, booking.id, 'approved'),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.red),
                      onPressed: () =>
                          showReasonDialog(context, booking.id, 'rejected'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
