import 'package:flutter/material.dart';

class SalonList extends StatefulWidget{
  @override
  _SalonListState createState()=>_SalonListState();

}

class _SalonListState extends State<SalonList>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: SingleChildScrollView(
    child: Column(
      children: [
        Padding(padding: EdgeInsets.only(left: 20,right: 20,top: 02),
          child: Row(
            children: [
              SizedBox(width: 10,),
              CircleAvatar(),
              SizedBox(width: 20,),
              Text("Rahul Pawar"),
            ],
          ),),
        Padding(padding: EdgeInsets.only(left: 20,right: 20,top: 02),
        child:
        Material(
          elevation: 01,
          child: Container(
            height: 200,
            width:MediaQuery.of(context).size.width,
            child: Image.asset("assets/images/booking13.jpg",height: 100,
              width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
          ),
        ),
        ),
        Padding(padding: EdgeInsets.only(left: 20,right: 20,top: 02),
        child: Row(
          children: [
            SizedBox(width: 10,),
            Icon(Icons.favorite_border),
            SizedBox(width: 10,),
            Text("Likes"),
            SizedBox(width: 10,),
            Icon(Icons.comment_bank_outlined),
            SizedBox(width: 10,),
            Text("Comments"),
            SizedBox(width: 10,),
          ],
         ),
        )
       ],
      ),
     ),
    );
  }
}