import "package:carousel_slider/carousel_slider.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:salonapp/services/shared_preferences.dart";

import "cust_booked_details.dart";
import "login screen/cust_home.dart";

class CustomerHomePage extends StatefulWidget{
  String userid;
  CustomerHomePage({required this.userid});
  @override
  _CustomerHomePageState createState()=>_CustomerHomePageState();

}

class _CustomerHomePageState extends State<CustomerHomePage>{

  @override
submit()async{
    await SharedprefHelper().getUserId();
    setState(() {

    });
  }

  @override
  void initState() {
    submit();
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(widget.userid.toString(),style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),),
        centerTitle: true,
        backgroundColor: Color(0xff715901),
        actions: [
          SizedBox(width: 10,),
          IconButton(onPressed: (){},
              tooltip:"My Account",
              icon: Icon(Icons.person,color:Colors.white)),
          SizedBox(width: 10,),
          IconButton(onPressed: (){},
              tooltip:"Notifications",
              icon: Icon(Icons.notification_important_outlined,color:Colors.white)),
          SizedBox(width: 10,),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child:UserAccountsDrawerHeader(
                accountName: null,
                accountEmail: Text(widget.userid.toString()))),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text("Search"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: (){},
            ),
          ],
        ),
      ),
      //backgroundColor: Color(#ebae34),
      body:
      SingleChildScrollView(
        child:
        Column(
          children: [
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: CarouselSlider(
                items: [
                  Container(
                    margin: EdgeInsets.only(left: 10,right: 10),
                    padding: EdgeInsets.only(left: 10,right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.greenAccent,
                      image: DecorationImage(
                        image: AssetImage("assets/images/cartoons/offer21.jpg",),
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Positioned(
                            bottom:10,
                            left: 10,
                            child: Text("Face Wash 20% get off",
                              style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w500),))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10,right: 10),
                    padding: EdgeInsets.only(left: 10,right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.greenAccent,
                      image: DecorationImage(
                          image: AssetImage("assets/images/cartoons/offer22.jpg"),
                          fit: BoxFit.cover
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Positioned(
                            bottom:10,
                            left: 10,
                            child: Text("Hair cutting 20% get off",
                              style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w500),)),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10,right: 10),
                    padding: EdgeInsets.only(left: 10,right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.greenAccent,
                      image: DecorationImage(
                          image: AssetImage("assets/images/cartoons/offer23.jpg"),
                          fit: BoxFit.cover
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Positioned(
                            bottom:10,
                            left: 10,
                            child: Text("Spacial Facial 20% get off",
                              style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w500),))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    margin: EdgeInsets.only(left: 10,right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.greenAccent,
                      image: DecorationImage(
                          image: AssetImage("assets/images/cartoons/offer24.jpg",
                          ),
                          fit: BoxFit.cover
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Positioned(
                            bottom:10,
                            left: 10,
                            child: Text("Face Wash 20% get off",
                              style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w500),))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    margin: EdgeInsets.only(left: 10,right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.greenAccent,
                      image: DecorationImage(
                          image: AssetImage("assets/images/cartoons/offer25.jpg"),
                          fit: BoxFit.cover
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Positioned(
                            bottom:10,
                            left: 10,
                            child: Text("Face Wash 20% get off",
                              style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w500),))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    margin: EdgeInsets.only(left: 10,right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.greenAccent,
                      image: DecorationImage(
                          image: AssetImage("assets/images/cartoons/offer26.jpg"),
                          fit: BoxFit.cover
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Positioned(
                            bottom:10,
                            left: 10,
                            child: Text("Stylish Bared 20% get off",
                              style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w500),))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    margin: EdgeInsets.only(left: 10,right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.greenAccent,
                      image: DecorationImage(
                          image: AssetImage("assets/images/cartoons/offer27.jpg"),
                          fit: BoxFit.cover
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Positioned(
                            bottom:10,
                            left: 10,
                            child: Text("Bared 20% get off",
                              style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w500),))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    margin: EdgeInsets.only(left: 10,right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.greenAccent,
                      image: DecorationImage(
                          image: AssetImage("assets/images/cartoons/offer28.jpg"),
                          fit: BoxFit.cover
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Positioned(
                            bottom:10,
                            left: 10,
                            child: Text("Face beauty 20% get off",
                              style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w500),)
                        ),
                      ],
                    ),
                  ),
                ],
                options: CarouselOptions(
                  initialPage: 0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  pauseAutoPlayOnManualNavigate: true,
                  pauseAutoPlayOnTouch: true,
                ),
              ),),
            ),
            Container(
              height: 250,
              decoration: BoxDecoration(
                  color: Color(0xff715901),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: (){
                         Navigator.push(context, MaterialPageRoute(
                             builder: (context)=>HomeScreen(userId: widget.userid,)));
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          elevation:10,
                          child: Container(
                            height: 100,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height:100,
                                  alignment: Alignment.topLeft,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(image: AssetImage("assets/images/img14.jpg"),fit: BoxFit.cover)
                                  ),
                                  child: Text("Booking",style: TextStyle(
                                      color: Color(0xff715901),fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 10,
                        child: Container(
                          height: 100,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height:100,
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(image: AssetImage("assets/images/img12.jpg"),fit: BoxFit.cover)
                                ),
                                child:  Text("Profile",style: TextStyle(
                                    color: Color(0xff715901),fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CustBookedPage()));
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          elevation: 10,
                          child: Container(
                            height: 100,
                            width: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.history,size: 30,color:Color(0xff715901),),
                                SizedBox(height:10),
                                Text("Booking History",style: TextStyle(
                                    color: Color(0xff715901),fontWeight: FontWeight.bold
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 10,
                        child: Container(
                          height: 100,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height:75,
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(image: AssetImage("assets/images/img11.jpg"),fit: BoxFit.cover)
                                ),
                                child:  Text("More",style: TextStyle(
                                    color: Color(0xff715901),fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Color(0xff715901),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Famous Salons in Your City",
                    style: TextStyle(
                  color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation:10,
                        child: Container(
                          height: 90,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(image: AssetImage("assets/images/salon1.jpg"),
                                  fit: BoxFit.cover),
                          ),
                        ),
                      ),

                      Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 10,
                        child: Container(
                          height: 90,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(image: AssetImage("assets/images/salon2.jpg"),
                                  fit: BoxFit.cover),
                          ),
                          ),
                        ),

                      Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 10,
                        child: Container(
                          height: 90,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: AssetImage("assets/images/salon3.jpg"),
                                fit: BoxFit.cover),
                          ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}