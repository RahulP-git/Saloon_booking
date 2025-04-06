import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salonapp/customer_screen/login%20screen/firebase_services.dart';
import 'package:salonapp/services/database.dart';


class AdminCustBookedPage extends StatefulWidget{
  @override
  _AdminCustBookedPageState createState()=>_AdminCustBookedPageState();

}

class _AdminCustBookedPageState extends State<AdminCustBookedPage>{

  @override
  void initState() {
    // getOntheLoad();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
        appBar: AppBar(
          title: Text("My Bookings"),
          centerTitle: true,
        ),
        body:StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('UserBooking').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(child: Text('No Data available.'));
              }
              var products = snapshot.data!.docs;
              return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    var product = products[index];
                    String custname=product["UserName"];
                    String custservices = product['Services'];
                    String custmobile = product['Mobile'];
                    String bookingdate=product["Date"];
                    String bookingtime=product["Time"];

                    return Material(
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
                            Text("UserName: "+ custname,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),),
                            Text("Service: "+ custservices,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),),
                            Row(
                              children: [
                                Text("Date: "+ bookingdate,style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),),
                                SizedBox(width: 15,),
                                Text("Time: "+ bookingtime,style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),),
                              ],
                            ),
                            Text("Contact: "+ custmobile,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),),

                            SizedBox(height: 20,),
                            Row(
                              children: [
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
                                    child: Text("Done", style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),),
                                  ),
                                ),
                                SizedBox(width: 20,),
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
                    );
                  });
            })
    );
  }
}