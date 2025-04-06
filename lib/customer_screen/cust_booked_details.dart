import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salonapp/customer_screen/login%20screen/firebase_services.dart';
import 'package:salonapp/customer_screen/ratings.dart';
import 'package:salonapp/services/database.dart';


class CustBookedPage extends StatefulWidget{
   String? productId;
   CustBookedPage({this.productId});
  @override
  _CustBookedPagePageState createState()=>_CustBookedPagePageState();

}

class _CustBookedPagePageState extends State<CustBookedPage>{
FirebaseFirestore _auth=  FirebaseFirestore.instance;
@override
  void initState() {
  // getOntheLoad();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("My Bookings"),
        centerTitle: true,
      ),
      backgroundColor: Color(0xff715901),
      body: StreamBuilder<QuerySnapshot>(

        stream: FirebaseFirestore.instance.collection('UserBooking').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No Data available.'));
          }

          var products = snapshot.data!.docs;
          return
            ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                var product = products[index];
                String salon = product['Salon'];
                String Services=product["Services"];
                String Date=product["Date"];
                String Time=product["Time"];
                String Email = product['Email'];
                String Mobile = product['Mobile'];
                String Address = product['Address'];
                return SingleChildScrollView(
                  child:Material(
                    elevation: 10,
                    child: Container(
                      height: 200,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Salon Name: "+ salon,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),),
                          Text("Service: "+ Services,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),),
                          Row(
                            children: [
                              Text("Date: "+ Date,style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),),
                              SizedBox(width: 15,),
                              Text("Time: "+ Time,style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),),
                            ],
                          ),
                          Text("Contact: "+Mobile,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),),
                          Text("Address "+ Address,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                 Navigator.push(context, MaterialPageRoute(
                                     builder: (context)=>RatingsPage()));
                                },
                                child: Container(
                                  height: 35,
                                  width: 100,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey,
                                  ),
                                  child: Text("Pending Approval", style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                  ),),
                                ),
                              ),
                              SizedBox(width: 15,),
                              GestureDetector(
                                onTap: () {

                                },
                                child: Container(
                                  height: 35,
                                  width: 100,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey,
                                  ),
                                  child: Text("Edit Booking", style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                  ),),
                                ),
                              ),
                              SizedBox(width: 20,),
                              GestureDetector(
                                onTap: () {
                                  // Method to update a user's information in the Firestore
                                  Future<void> updateUser(String userId) async {
                                    try {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('updated successfully!')),
                                      );
                                    } catch (e) {
                                      // Handle errors (e.g., if the update fails)
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Error updating user: $e')),
                                      );
                                    }
                                  }
                                },
                                child: Container(
                                  height: 35,
                                  width: 100,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey,
                                  ),
                                  child: Text(
                                    "Delete Booking", style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                  ),),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
        },
      ),
    );
  }
}