import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salonapp/saloon_pannel/saloon_login.dart';
import 'package:salonapp/saloon_pannel/user_booking_approval.dart';
import '../../customer_screen/onboadring.dart';
import '../customer_screen/customer_booking_history.dart';
import '../customer_screen/login screen/firebase_services.dart';

class SaloonHomePage extends StatefulWidget{
  final String email;
  SaloonHomePage({required this.email});
  @override
  _SaloonHomePageState createState()=>_SaloonHomePageState();

}

class _SaloonHomePageState extends State<SaloonHomePage>{
  final FirebaseAuthServices _auth= FirebaseAuthServices();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Salon Home Page!!"),
          actions: [
            SizedBox(width: 17,),
            Icon(Icons.circle,color: Colors.green,),
            SizedBox(width: 10,),
            Text("Active",style: TextStyle(
                fontWeight: FontWeight.bold
            ),),
            SizedBox(width: 17,),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Hi"),
                accountEmail: Text(widget.email),
                currentAccountPicture: CircleAvatar(),),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Profile"),
              ),
              ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>UserBookingApprovalScreen(
                        email: widget.email,)));
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
                onTap: (){
                 _auth.logout();
                 ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content: Text("LogOut Successfully!!")));
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>SaloonLoginPage()));
                },
                leading: Icon(Icons.logout),
                title: Text("LogOut"),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.amber,
        body:
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Material(
                elevation: 07,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 250,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        elevation: 05,
                    child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white60,
                        ),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxuDjRq-a3Rm1e0En5pOkul7iqALAkf9435Q&s",
                          height: 170,
                          width: 150,),
                          SizedBox(height: 10,),
                          Text("Help Center",style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ],
                      ),
                      ),
                      ),
                      Card(
                        elevation: 05,
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white60,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(height: 05,),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context)=>UserBookingApprovalScreen(email: widget.email,)));
                                },
                                child: Container(
                                  height: 40,
                                  width:150 ,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.amber
                                  ),
                                  alignment: Alignment.center,
                                  child: Text("Booking Approval",style: TextStyle(
                                      color: Colors.white
                                  ),),
                                ),
                              ),
                              SizedBox(height: 05,),
                              GestureDetector(
                                onTap: (){},
                                child: Container(
                                  height: 40,
                                  width:150 ,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.amber
                                  ),
                                  alignment: Alignment.center,
                                  child: Text("Today's Bookings",style: TextStyle(
                                      color: Colors.white
                                  ),),
                                ),
                              ),
                              SizedBox(height: 05,),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context)=>UserBookingApprovalScreen(email: widget.email,)));
                                },
                                child: Container(
                                  height: 40,
                                  width:150 ,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.amber
                                  ),
                                  alignment: Alignment.center,
                                  child: Text("Booking History",style: TextStyle(
                                    color: Colors.white
                                  ),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Material(
                    elevation: 05,
                    borderRadius: BorderRadius.circular(20),
                    child:
                    Column(
                      children: [
                        Container(
                          height: 120,
                          width: 130,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUKtiKT8xYUx6v4cooODEaDtQ_aVHfB_zO7g&s")
                              )
                          ),
                        ),
                        Text("Create Services", style: TextStyle(
                          color: Colors.amber,
                        ),)
                      ],
                    ),
                  ),

                  Material(
                    elevation: 05,
                    borderRadius: BorderRadius.circular(20),
                    child:
                    Column(
                      children: [
                        Container(
                          height: 120,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              //fit: BoxFit.cover,
                                image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsFuPeK4O8JyI8kbdp7PNHlQSXvi9Gd77pvEzuyL8K8YJLAqNJ3vvYhZdial5hMU2Ai08&usqp=CAU",
                                    ),
                            ),
                          ),
                         // child: Image.network(fit: BoxFit.cover,),
                                          ),
                        Text("Payment", style: TextStyle(
                          color: Colors.amber,
                        ),)
                      ],
                    ),
                  ),
                  Material(
                    elevation: 05,
                    borderRadius: BorderRadius.circular(20),
                    child:
                    Column(
                      children: [
                        Container(
                          height: 120,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              //fit: BoxFit.cover,
                              image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYf4-D7M8a7cWCUcKxa7Zcnq02WFBGbMdG_g&s"),
                            ),
                          ),
                        ),
                        Text("My Wallet !!", style: TextStyle(
                          color: Colors.amber,
                        ),)
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Material(
                    elevation: 05,
                    borderRadius: BorderRadius.circular(20),
                    child:
                    Column(
                      children: [
                        Container(
                          height: 120,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                             // fit: BoxFit.cover,
                              image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTtj-pj536-lt0RDlhzbclN3h_bd_kPUdy9A&s")
                            ),
                          ),
                        ),
                        Text("Beautify ", style: TextStyle(
                          color: Colors.amber,
                        ),),
                      ],
                    ),
                  ),
                  Material(
                    elevation: 05,
                    borderRadius: BorderRadius.circular(20),
                    child:
                    Column(
                      children: [

                        Container(
                          height: 120,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              //fit: BoxFit.cover,
                                image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzgXgolcNVHNyHtvP03cZhLEXs0b7Dmny1pw&s")),
                          ),
                        ),
                        Text("Sharing !!",
                          style: TextStyle(
                            color: Colors.amber,
                          ),)
                      ],
                    ),
                    // child: Image.network(fit: BoxFit.cover,),
                  ),
                  Material(
                    elevation: 05,
                    borderRadius: BorderRadius.circular(20),
                    child:
                    Column(
                      children: [
                        Container(
                          height: 120,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                             // fit: BoxFit.cover,
                              image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGZaVHC08f6SEeoM5FNpIEAohFSLaI27FnwA&s") ),
                        ),),
                        Text("More", style: TextStyle(
                          color: Colors.amber,
                        ),)
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
    );
  }
}