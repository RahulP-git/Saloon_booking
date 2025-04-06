import 'package:flutter/material.dart';

import '../admin_pannel/adminloginscreen/admin_login_page.dart';


class RatingsPage extends StatelessWidget {
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
              child: RatingBar(),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Thank you !!\nFor Visiting")));
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminLoginPage()));
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
  @override
  _RatingBarState createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  int _rating = 0; // Default rating

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < _rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: 40,
          ),
          onPressed: () {
            setState(() {
              _rating = index + 1; // Update rating
            });
          },
        );
      }),
    );
  }
}
