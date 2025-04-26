import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserBookingApprovalScreen extends StatefulWidget {
  final String email;
  UserBookingApprovalScreen({required this.email});
  _BookingApprovalScreenState createState() => _BookingApprovalScreenState();
}
class _BookingApprovalScreenState extends State<UserBookingApprovalScreen>{
  @override
  bool pending=true;
  bool approved=false;
  bool rejected=false;

  final CollectionReference bookings =
  FirebaseFirestore.instance.collection('UserBooking');

  Future<void> approveBooking(String bookingId) async {
    await bookings.doc(bookingId).update({'approvalStatus': 'approved'});
  }

  Future<void> rejectBooking(String bookingId) async {
    await bookings.doc(bookingId).update({'approvalStatus': 'rejected'});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(title: Text('Customer Booking List')),
      body:
      SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child:
        Column(
          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                SizedBox(width: 10,),
                Material(
                  elevation: 05,
                  borderRadius: BorderRadius.circular(20),
                  child: GestureDetector(
                    onTap: (){
                      pending=false;
                      approved=true;
                      rejected=false;
                      setState((){});
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:approved? Colors.green:Colors.white,
                      ),
                      child: Text("Approved List"),
                    ),
                  ),
                ),

                Material(
                  elevation: 05,
                  borderRadius: BorderRadius.circular(20),
                  child:GestureDetector(
                    onTap: () {
                      pending = true;
                      approved = false;
                      rejected = false;
                      setState(() {});
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:pending?Colors.green: Colors.white,
                      ),
                      child: Text("Pending List"),
                    ),
                  ),
                ),

                Material(
                  elevation: 05,
                  borderRadius: BorderRadius.circular(20),
                  child: GestureDetector(
                    onTap: () {
                      pending = false;
                      approved = false;
                      rejected = true;
                      setState(() {});
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:rejected?Colors.green: Colors.white,
                      ),
                      child: Text("Rejected List"),
                    ),
                  ),
                )
              ],),
            SizedBox(height: 20,),
            StreamBuilder<QuerySnapshot>(
              stream:
              // bookings.where("Email",isEqualTo:widget.email,).snapshots(),
              pending? bookings.where('approvalStatus', isEqualTo: 'pending')
                  .where("Email",isEqualTo: widget.email).
              snapshots():
              approved ? bookings.where('approvalStatus', isEqualTo: 'approved')
                  .where("Email",isEqualTo: widget.email).snapshots():
              bookings.where('approvalStatus', isEqualTo: 'rejected')
                  .where("Email",isEqualTo: widget.email).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No pending bookings.'));
                }

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var booking = snapshot.data!.docs[index];
                    return
                      Card(
                        elevation: 10,
                        margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: Container(
                          padding:const EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.blueAccent,
                                  radius: 35,
                                  backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9_nexPhhBp_kaH26I430nyu5s_kwiFDjnDQ&s"),
                                ),
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 10,),

                                      Text(booking["UserName"],style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 15,
                                      ),),
                                      SizedBox(width: 15,),
                                      Row(
                                        children: [
                                          Icon(Icons.mobile_friendly_rounded,
                                            color: Colors.black54,
                                            size: 17,),
                                          SizedBox(width: 05,),
                                          Text(booking["UserMobile"]!=null?booking["UserMobile"]:"No",style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                          ),),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.email,
                                            color: Colors.black54,
                                            size: 17,),
                                          SizedBox(width: 05,),
                                          Text(booking["UserEmail"],style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                          ),),
                                        ],
                                      ),
                                    ]),
                                SizedBox(width: 20,),
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 10,),
                                      Text(booking["Date"],style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),),
                                      SizedBox(width: 10,),
                                      Text(booking["Time"],style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),),
                                      SizedBox(width: 10,),
                                      Text(booking["Services"],style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),),
                                    ]),

                                SizedBox(width: 20,),
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(width: 10,),
                                      Text("Status",style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),),
                                      SizedBox(width: 20,),
                                      Row(
                                        children: [
                                          rejected? Container(): IconButton(
                                            tooltip: "Approved",
                                            icon: Icon(Icons.check, color: Colors.green),
                                            onPressed:pending? () => approveBooking(booking.id)
                                                :(){},
                                          ),
                                          SizedBox(width: 10,),
                                          approved ? Container():IconButton(
                                            tooltip: "Rejected",
                                            icon: Icon(Icons.close, color: Colors.red),
                                            onPressed:pending? () {
                                              rejectBooking(booking.id);
                                            } :(){},
                                          ),
                                        ],
                                      ),
                                    ]),

                              ]),
                         ),
                      );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
