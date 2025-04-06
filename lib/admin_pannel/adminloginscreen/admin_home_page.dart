import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../customer_list.dart';
import 'admin_booking_page.dart';

class AdminHomePage extends StatefulWidget{
  @override
  _AdminHomePageState createState()=>_AdminHomePageState();

}

class _AdminHomePageState extends State<AdminHomePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Booking Page"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text("data"),
                accountEmail: Text("data"),
            currentAccountPicture: CircleAvatar(),),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminCustBookedPage()));
              },
              leading: Icon(Icons.group),
              title: Text("Bookings"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Help"),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("LogOut"),
            ),
          ],
        ),
      ),
      body:
      SingleChildScrollView(
        child: Container(
          //color: Colors.amber,
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                      child: Container(
                        height: 300,
                        //color: Colors.grey,
                        child: Stack(
                          children: [
                            Container(
                                color: Colors.blueAccent,
                                height: 250,
                                width: MediaQuery.of(context).size.width,
                                child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNNHLJDJkRGew0RKvMbgLUPtz9J1OMXMhDwA&s",
                                    fit:BoxFit.cover
                                  )
                            ),
                            Positioned(
                              bottom: 0,
                              right: 25,
                              child: CircleAvatar(

                                radius: 50,
                                backgroundImage: NetworkImage("data:image/jpeg;base64,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"),
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom:05,
                                    right: 05,
                                    child: TextButton(onPressed: (){},
                                        child: Text("Edit")),
                                  ),
                                ],
                              )
                                ,),
                            ),
                          ],
                        ),
                      )),
                  Positioned(
                    top: 20,
                    right: 20,
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.favorite,color: Colors.pinkAccent,),
                        Text("Like: 21K",
                        style: TextStyle(color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ],
              ),
            SizedBox(height: 10,),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),

              child:
              Row(
                children: [
                  Icon(Icons.file_copy_outlined),
                  SizedBox(width: 20,),
                  Text("Manage Bookings",style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),),
                ],
              ),
            ),
              SizedBox(height: 10,),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child:
                Row(
                  children: [
                    Icon(Icons.file_copy_outlined),
                    SizedBox(width: 20,),
                    Text("Manage Customers",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child:
                Row(
                  children: [
                    Icon(Icons.account_balance),
                    SizedBox(width: 20,),
                    Text("Manage Accounts",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ),
              SizedBox(height: 10,),
        ]),
        ),
      )
    );
  }
}