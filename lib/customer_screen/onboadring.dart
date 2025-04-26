import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Approvallist extends StatefulWidget {
  @override
  _ApprovallistState createState() => _ApprovallistState();
}

class _ApprovallistState extends State<Approvallist> {
  double rating = 4.2;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body:
      Card(
        elevation: 10,
        margin: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
         // height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  SizedBox(
                    width: 10,
                  ),

                  Text(
                    "Rekha Parlor",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),

                  Row(
                    children: [
                      Icon(Icons.mobile_friendly_rounded,color: Colors.blueAccent,),
                      SizedBox(
                        width: 05,
                      ),
                      Text("+91 9766568600"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.email,color: Colors.brown,),
                      SizedBox(
                        width: 05,
                      ),
                      Text("rahul@gmail.com"),
                    ],
                  )
                ]),

                SizedBox(
                  width: 10,
                ),
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
                  "Address: At Post Boripardhi,Tal-Daund,Dist Pune",
                  style:
                      TextStyle(color: Colors.black54,
                          fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Text("Select Date"),
            SizedBox(height: 10,),

            SizedBox(height: 10,),
            Text("Select Time"),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 35,
                  width: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text("9:00AM"),
                ),
                Container(
                  height: 30,
                  width: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text("10:00AM"),
                ),
                Container(
                  height: 30,
                  width: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text("11:00AM"),
                ),
                Container(
                  height: 30,
                  width: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text("12:00PM"),
                )
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 35,
                  width: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text("01:00PM"),
                ),
                Container(
                  height: 30,
                  width: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text("02:00PM"),
                ),
                Container(
                  height: 30,
                  width: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text("03:00PM"),
                ),
                Container(
                  height: 30,
                  width: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text("04:00PM"),
                )
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 35,
                  width: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text("05:00PM"),
                ),
                Container(
                  height: 30,
                  width: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text("06:00PM"),
                ),
                Container(
                  height: 30,
                  width: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text("07:00PM"),
                ),
                Container(
                  height: 30,
                  width: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text("08:00PM"),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              height: 40,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blueAccent,
              ),
              child: Text("Book Now"),
            ),
          ]),
        ),
      ),
    );
  }
}
