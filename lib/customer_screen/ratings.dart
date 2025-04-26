import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../admin_pannel/adminloginscreen/admin_login_page.dart';
import '../saloon_pannel/saloon_login.dart';


class RatingsPage extends StatelessWidget {
  String email;
  RatingsPage({required this.email});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(' Give Ratings !!',style: TextStyle(
              fontWeight: FontWeight.w500,
            ),),
            SizedBox(height: 20,),
            Center(
              child: RatingBar(email: email,),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Thank you !!\nFor Visiting")));
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SaloonLoginPage()));
              },
              child: Container(
                child: Text("Submit",style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 45,
                width: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingBar extends StatefulWidget {
   String email;
   RatingBar({required this.email});
  @override
  _RatingBarState createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  int _rating = 0; // Default rating
  final CollectionReference bookings =
  FirebaseFirestore.instance.collection('"Salon"');
late String id;
  Future<void> UpdateRatings(String bookingId) async {
   // await bookings.doc(bookingId).snapshots();
     await bookings.doc(bookingId).update({'Ratings': _rating});
  }

  void submitRating(String userId, double ratingValue) async {
    await FirebaseFirestore.instance.collection('ratings').doc(userId).set({
      'rating': ratingValue,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < _rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: 25,
          ),
          onPressed: () {
            setState(() {

              _rating = index + 1; // Update rating
              UpdateRatings(widget.email);
            });
          },
        );
      }),
    );
  }
}
