import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salonapp/customer_screen/ratings.dart';

class CustomerBookingHistory extends StatefulWidget {
  final email;
  CustomerBookingHistory({required this.email});
  _CustomerBookingHistoryState createState() => _CustomerBookingHistoryState();
}
class _CustomerBookingHistoryState extends State<CustomerBookingHistory>{
  @override
  
  final CollectionReference bookings =
  FirebaseFirestore.instance.collection('UserBooking');

  Future<void> UserBooking(String bookingId) async {
    await bookings.doc(bookingId).snapshots();
   // await bookings.doc(bookingId).update({'approvalStatus': 'approved'});
  }

  Future<void> rejectBooking(String bookingId) async {
    await bookings.doc(bookingId).update({'approvalStatus': 'rejected'});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(title: Text('My Bookings')),
      body: StreamBuilder<QuerySnapshot>(
              stream:FirebaseFirestore.instance.collection('UserBooking').where("UserEmail",isEqualTo:widget.email).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No bookings.'));
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
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white
                          ),
                          child:
                          Column(
                            children: [
                              Row(
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
                                          Text("Salon Name",style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),),
                                          SizedBox(width: 10,),
                                          Text(booking["Salon"],style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 15,
                                          ),),
                                          SizedBox(width: 15,),
                                          Row(
                                            children: [
                                              Icon(Icons.contact_phone,
                                                color: Colors.black54,
                                                size: 20,),
                                              SizedBox(width: 05,),
                                              Text(booking["Mobile"],style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                              ),),
                                            ],
                                          ),
                                          SizedBox(height: 10,),
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
                                         Text(booking["approvalStatus"],style: TextStyle(
                                           color: Colors.black,
                                           fontWeight: FontWeight.bold,
                                           fontSize: 12,
                                         ),)
                                        ]),
                                  ]),
                              Row(
                                children: [
                                  Container(width: 95,),
                                  Icon(Icons.location_on,
                                    color: Colors.blue,
                                    size: 20,),
                                  SizedBox(width: 05,),
                                  Text(booking["Address"],style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),),
                                ],
                              ),
                              SizedBox(height: 20,),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context)=>RatingsPage(email:widget.email)));
                                },
                                child: Container(
                                  height: 35,
                                  width: 100,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Text("Ratings"),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                  },
                );
              },
            )
    );
  }
}
