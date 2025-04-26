import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'detailed_page.dart';

// Salon List Screen
class SalonListScreen extends StatefulWidget {
  // String userId;
  // HomeScreen({required this.userId});
  @override
  _SalonListScreenState createState() => _SalonListScreenState();
}
class _SalonListScreenState extends State<SalonListScreen>{
  double rating = 4.2;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body:
      SingleChildScrollView(
        child:
        Column(
          children: [
            SizedBox(height: 10,),
            SizedBox(
              height: 20,
            ),
            Text("Salon List ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),),
            SizedBox(height: 20,),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('Salon').
                where("ActivationStatus",isEqualTo: "Active").snapshots(),
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
                        String Name = product['SalonName'];
                       // var Image = product['Image'];
                        String Email = product['Email'];
                        String Mobile = product['Mobile'];
                        String Address = product['Address'];
                        return
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context)=>ProductDetailsPage(
                                productId: product.id,
                                Name: Name,
                                Email: Email,
                                Mobile:Mobile,
                                Address: Address,
                              )));
                            },
                            child:
                              Container(
                                padding: const EdgeInsets.all(20),
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20), color: Colors.white),
                                child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          Name,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),

                                        Center(
                                          child: RatingBarIndicator(
                                            rating: rating,
                                            itemBuilder: (context, index) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            itemCount: 5,
                                            itemSize: 15.0,
                                            direction: Axis.horizontal,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.mobile_friendly_rounded,color: Colors.blueAccent,),
                                            SizedBox(
                                              width: 05,
                                            ),
                                            Text(Mobile),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.email,color: Colors.brown,),
                                            SizedBox(
                                              width: 05,
                                            ),
                                            Text(Email),
                                          ],
                                        )
                                      ]),
                                      Container(
                                          height: 70,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Image.network(
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1x204iMWzVwMBpRcZQOW5oSAy7XQyV8FTHg&s",
                                            fit: BoxFit.cover,
                                          )),
                                      SizedBox(
                                        width: 10,
                                      ),

                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 10,),
                                      Text("Open 9:00AM",style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.green
                                      ),),
                                      SizedBox(width: 10,),
                                      Text("Close 10:00PM",style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.red
                                      ),),
                                      SizedBox(width: 10,),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on,color: Colors.blueAccent,),
                                      SizedBox(width: 05,),
                                      Text(
                                        Address,
                                        style:
                                        TextStyle(color: Colors.black54,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  )
                                ]),
                              ),
                          );
                      },
                    );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
