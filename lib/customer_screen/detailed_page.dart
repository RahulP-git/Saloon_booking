import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../services/database.dart';
import '../services/shared_preferences.dart';
import 'cust_booked_details.dart';
import 'customer_booking_history.dart';
import 'onboadring.dart';

class ProductDetailsPage extends StatefulWidget {
  final String productId;
  final String Name;
  final String Email;
  final String Mobile;
  final String Address;

  ProductDetailsPage({
    required this.productId,
    required this.Name,
    required this.Email,
    required this.Mobile,
    required this.Address,
  });

  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  String? name, image, address, email, mobile, adminName;
  String? salonname;
  getDatafromSharedPref() async {
    adminName = await SharedprefHelper().getAdminName();
    image = await SharedprefHelper().getAdminImage();
    email = await SharedprefHelper().getUserEmail();
    mobile = await SharedprefHelper().getUserMobileNumber();
    salonname = await SharedprefHelper().getAdminSalonName();
    name = await SharedprefHelper().getUserName();
    address = await SharedprefHelper().getAdminAddress();
    setState(() {});
  }

  getOntheLoad() async {
    await getDatafromSharedPref();
    setState(() {});
  }

  final List<String> serviceList = [
    "Stylish Hair-cut",
    "Head Massage",
    "Face Wash",
    "Hair Wash",
    "Colors on Hairs",
    "Kids Spacial",
    "Salon Spacial "
  ];

  String isSelected = "Stylish Hair-cut";
  bool one = false;
  bool two = false;
  bool tree = false;
  bool four = false;
  bool five = false;
  bool six = false;
  bool seven = false;
  bool eight = false;
  bool nine = false;
  bool ten = false;
  bool eleven = false;
  bool twelve = false;

  @override
  void initState() {
    getOntheLoad();

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('Salon')
                    .doc(widget.productId)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return Center(child: Text('Data Not found.'));
                  }

                  var productData = snapshot.data!;
                  return SingleChildScrollView(
                    child: Card(
                      elevation: 10,
                      margin: const EdgeInsets.all(20),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        // height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          widget.Name,
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
                                            Icon(
                                              Icons.mobile_friendly_rounded,
                                              color: Colors.blueAccent,
                                            ),
                                            SizedBox(
                                              width: 05,
                                            ),
                                            Text(widget.Mobile),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.email,
                                              color: Colors.brown,
                                            ),
                                            SizedBox(
                                              width: 05,
                                            ),
                                            Text(widget.Email),
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
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Open 9:00AM",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.green),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Close 10:00PM",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.red),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.blueAccent,
                                  ),
                                  SizedBox(
                                    width: 05,
                                  ),
                                  Text(
                                    widget.Address,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    width: 150,
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        Text(
                                          "Select Services",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        DropdownButton(
                                            value: isSelected,
                                            items: serviceList
                                                .map((item) =>
                                                    DropdownMenuItem<String>(
                                                        value: item,
                                                        child: Text(
                                                          item,
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.black),
                                                        )))
                                                .toList(),
                                            onChanged: (item) {
                                              setState(() {
                                                isSelected = item!;
                                              });
                                            }),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    width: 150,
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        Text(
                                          "Select Date",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            _selectedDate(context);
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.calendar_month,
                                                color: Colors.black,
                                                size: 25,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "${_selectDateTime.day}/${_selectDateTime.month}/${_selectDateTime.year}",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Divider(),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Select Date",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      one = false;
                                      two = false;
                                      tree = false;
                                      four = false;
                                      five = false;
                                      six = false;
                                      seven = false;
                                      eight = false;
                                      nine = true;
                                      ten = false;
                                      eleven = false;
                                      twelve = false;
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 80,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color:
                                            nine ? Colors.green : Colors.grey,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text("09:00AM"),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      one = false;
                                      two = false;
                                      tree = false;
                                      four = false;
                                      five = false;
                                      six = false;
                                      seven = false;
                                      eight = false;
                                      nine = false;
                                      ten = true;
                                      eleven = false;
                                      twelve = false;
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 70,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: ten ? Colors.green : Colors.grey,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text("10:00AM"),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      one = false;
                                      two = false;
                                      tree = false;
                                      four = false;
                                      five = false;
                                      six = false;
                                      seven = false;
                                      eight = false;
                                      nine = false;
                                      ten = false;
                                      eleven = true;
                                      twelve = false;
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 70,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color:
                                            eleven ? Colors.green : Colors.grey,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text("11:00AM"),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      one = false;
                                      two = false;
                                      tree = false;
                                      four = false;
                                      five = false;
                                      six = false;
                                      seven = false;
                                      eight = false;
                                      nine = false;
                                      ten = false;
                                      eleven = false;
                                      twelve = true;
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 70,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color:
                                            twelve ? Colors.green : Colors.grey,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text("12:00PM"),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      one = true;
                                      two = false;
                                      tree = false;
                                      four = false;
                                      five = false;
                                      six = false;
                                      seven = false;
                                      eight = false;
                                      nine = false;
                                      ten = false;
                                      eleven = false;
                                      twelve = false;
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 80,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: one ? Colors.green : Colors.grey,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text("01:00PM"),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      one = false;
                                      two = true;
                                      tree = false;
                                      four = false;
                                      five = false;
                                      six = false;
                                      seven = false;
                                      eight = false;
                                      nine = false;
                                      ten = false;
                                      eleven = false;
                                      twelve = false;
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 70,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: two ? Colors.green : Colors.grey,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text("02:00PM"),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      one = false;
                                      two = false;
                                      tree = true;
                                      four = false;
                                      five = false;
                                      six = false;
                                      seven = false;
                                      eight = false;
                                      nine = false;
                                      ten = false;
                                      eleven = false;
                                      twelve = false;
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 70,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color:
                                            tree ? Colors.green : Colors.grey,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text("03:00PM"),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      one = false;
                                      two = false;
                                      tree = false;
                                      four = true;
                                      five = false;
                                      six = false;
                                      seven = false;
                                      eight = false;
                                      nine = false;
                                      ten = false;
                                      eleven = false;
                                      twelve = false;
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 70,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color:
                                            four ? Colors.green : Colors.grey,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text("04:00PM"),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      one = false;
                                      two = false;
                                      tree = false;
                                      four = false;
                                      five = true;
                                      six = false;
                                      seven = false;
                                      eight = false;
                                      nine = false;
                                      ten = false;
                                      eleven = false;
                                      twelve = false;
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 80,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color:
                                            five ? Colors.green : Colors.grey,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text("05:00PM"),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      one = false;
                                      two = false;
                                      tree = false;
                                      four = false;
                                      five = false;
                                      six = true;
                                      seven = false;
                                      eight = false;
                                      nine = false;
                                      ten = false;
                                      eleven = false;
                                      twelve = false;
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 70,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: six ? Colors.green : Colors.grey,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text("06:00PM"),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      one = false;
                                      two = false;
                                      tree = false;
                                      four = false;
                                      five = false;
                                      six = false;
                                      seven = true;
                                      eight = false;
                                      nine = false;
                                      ten = false;
                                      eleven = false;
                                      twelve = false;
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 70,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color:
                                            seven ? Colors.green : Colors.grey,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text("07:00PM"),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      one = false;
                                      two = false;
                                      tree = false;
                                      four = false;
                                      five = false;
                                      six = false;
                                      seven = false;
                                      eight = true;
                                      nine = false;
                                      ten = false;
                                      eleven = false;
                                      twelve = false;
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 70,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color:
                                            eight ? Colors.green : Colors.grey,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text("08:00PM"),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  getBooking(
                                      email.toString(), mobile.toString());
                                },
                                child: Container(
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
                              ),
                            ]),
                      ),
                    ),

                    //       Container(
                    //           child: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             children: [
                    //               SizedBox(height: 05),
                    //               Column(
                    //                 mainAxisAlignment: MainAxisAlignment.start,
                    //                 crossAxisAlignment: CrossAxisAlignment.start,
                    //                 children: [
                    //                   Center(
                    //                     child: Image.network(productData["Image"],
                    //                       fit: BoxFit.cover,),
                    //                   ),
                    //                   SizedBox(height: 05),
                    //                   Center(
                    //                     child: Text(
                    //                       "Name: "+ widget.Name,
                    //                       style: TextStyle(
                    //                           fontSize: 15, fontWeight: FontWeight.bold,
                    //                         color:Colors.black),
                    //                     ),
                    //                   ),
                    //                   SizedBox(height: 05),
                    //                   Center(
                    //                     child: Row(
                    //                       mainAxisAlignment: MainAxisAlignment.center,
                    //                       crossAxisAlignment: CrossAxisAlignment.start,
                    //                       children: [
                    //                         Text("Open: 09:00AM", style: TextStyle(
                    //                              fontSize: 12,
                    //                             fontWeight: FontWeight.bold,
                    //                           color:Colors.black,
                    //                         ),),
                    //                         SizedBox(width: 15,),
                    //                         Text("Closed: 10:00PM", style: TextStyle(
                    //                             color:Colors.black, fontSize: 12,
                    //                             fontWeight: FontWeight.bold
                    //                         ),),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                   SizedBox(height: 05,),
                    //                   Center(
                    //                     child: Row(
                    //                       mainAxisAlignment: MainAxisAlignment.center,
                    //                       crossAxisAlignment: CrossAxisAlignment.start,
                    //                       children: [
                    //                         Icon(Icons.email, size: 15,
                    //                           color: Colors.black,),
                    //                         SizedBox(width: 05),
                    //                         Text(
                    //                          widget.Email,
                    //                           style: TextStyle(fontSize: 12,
                    //                               color:Colors.black),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                   SizedBox(height: 05),
                    //                   Center(
                    //                     child: Row(
                    //                       mainAxisAlignment: MainAxisAlignment.center,
                    //                       crossAxisAlignment: CrossAxisAlignment.start,
                    //                       children: [
                    //                         Icon(Icons.call, size: 15,
                    //                           color: Colors.black,),
                    //                         SizedBox(width: 05),
                    //                         Text(
                    //                          productData["Mobile"],
                    //                           style: TextStyle(fontSize: 12,
                    //                               color:Colors.black),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                   SizedBox(height: 05),
                    //                   Center(
                    //                     child: Row(
                    //                         mainAxisAlignment: MainAxisAlignment.center,
                    //                         crossAxisAlignment: CrossAxisAlignment.start,
                    //                         children: [
                    //                           Text(
                    //                             "Address:", style: TextStyle(fontSize: 12,
                    //                               color:Colors.black),),
                    //                           SizedBox(width: 05),
                    //                           Text(
                    //                             widget.Address,
                    //                             style: TextStyle(fontSize: 12,
                    //                                 color:Colors.black),
                    //                           ),
                    //                         ]
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       );
                    //   },
                    // ),
                    // Divider(),
                    // Text("Select Services",style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 15,
                    //     fontWeight: FontWeight.bold
                    // ),), DropdownButton(
                    //     value: isSelected,
                    //     items: serviceList.map((item)=>DropdownMenuItem<String>(
                    //         value: item,
                    //         child: Text(item,style: TextStyle(fontSize: 12,
                    //         color: Colors.black),))).toList(),
                    //     onChanged: (item){
                    //       setState(() {
                    //         isSelected=item!;
                    //       });
                    //     }),
                    // Divider(),
                    // SizedBox(height: 10,),
                    // Text("Select Date",style: TextStyle(
                    //     color:Colors.black,
                    //     fontSize: 15,
                    //     fontWeight: FontWeight.bold
                    // ),),
                    // GestureDetector(
                    //   onTap: (){
                    //     _selectedDate(context);
                    //   },
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Icon(Icons.calendar_month,color: Colors.black,size: 25,),
                    //       SizedBox(width: 10,),
                    //       Text("${_selectDateTime.day}/${_selectDateTime.month}/${_selectDateTime.year}",
                    //         style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),),
                    //     ],
                    //   ),
                    // ),
                    // Divider(),
                    // Text("Available Time Slot",
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //       color:Colors.black,
                    //     fontSize: 15
                    //   ),
                    // ),
                    // Container(
                    //   height: 320,
                    //   width: MediaQuery.of(context).size.width,
                    //   alignment: Alignment.center,
                    //   decoration: BoxDecoration(
                    //     color: Colors.transparent,
                    //     borderRadius: BorderRadius.circular(20),
                    //   ),
                    //   child:
                    //   Column(
                    //     children: [
                    //       SizedBox(height: 10,),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           GestureDetector(
                    //             onTap: (){
                    //               one=true;
                    //               two=false;
                    //               tree=false;
                    //               four=false;
                    //               five=false;
                    //               six=false;
                    //               seven=false;
                    //               eight=false;
                    //               setState(() {
                    //
                    //               });
                    //             },
                    //             child:  Container(
                    //               padding: EdgeInsets.all(10),
                    //               margin: EdgeInsets.all(10),
                    //               decoration:BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(10),
                    //                 color: one ? Colors.green:Colors.grey
                    //               ),
                    //               child: Text("01:00PM",style: TextStyle(
                    //                   color: Colors.black,
                    //                   fontSize: 12,
                    //                   fontWeight: FontWeight.bold
                    //               ),),
                    //             ),
                    //           ),
                    //           GestureDetector(
                    //             onTap: (){
                    //               one=false;
                    //               two=true;
                    //               tree=false;
                    //               four=false;
                    //               five=false;
                    //               six=false;
                    //               seven=false;
                    //               eight=false;
                    //               setState(() {
                    //
                    //               });
                    //             },
                    //             child:  Container(
                    //               padding: EdgeInsets.all(10),
                    //               margin: EdgeInsets.all(10),
                    //               decoration:BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(10),
                    //                 color: two ? Colors.green:Colors.grey,
                    //               ),
                    //               child: Text("02:00PM",style: TextStyle(
                    //                   color: Colors.black,
                    //                   fontSize: 12,
                    //                   fontWeight: FontWeight.bold
                    //               ),),
                    //             ),
                    //           ),
                    //           GestureDetector(
                    //             onTap: (){
                    //               one=false;
                    //               two=false;
                    //               tree=true;
                    //               four=false;
                    //               five=false;
                    //               six=false;
                    //               seven=false;
                    //               eight=false;
                    //               setState(() {
                    //
                    //               });
                    //             },
                    //             child:  Container(
                    //               padding: EdgeInsets.all(10),
                    //               margin: EdgeInsets.all(10),
                    //               decoration:BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(10),
                    //                 color: tree ? Colors.green:Colors.grey,
                    //               ),
                    //               child: Text("03:00PM",style: TextStyle(
                    //                   color: Colors.black,
                    //                   fontSize: 12,
                    //                   fontWeight: FontWeight.bold
                    //               ),),
                    //             ),
                    //           ),
                    //           GestureDetector(
                    //             onTap: (){
                    //               one=false;
                    //               two=false;
                    //               tree=false;
                    //               four=true;
                    //               five=false;
                    //               six=false;
                    //               seven=false;
                    //               eight=false;
                    //               setState(() {
                    //
                    //               });
                    //             },
                    //             child:  Container(
                    //               padding: EdgeInsets.all(10),
                    //               margin: EdgeInsets.all(10),
                    //               decoration:BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(10),
                    //                 color: four ? Colors.green:Colors.grey,
                    //               ),
                    //               child: Text("04:00PM",style: TextStyle(
                    //                   color: Colors.black,
                    //                   fontSize: 12,
                    //                   fontWeight: FontWeight.bold
                    //               ),),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           GestureDetector(
                    //             onTap: (){
                    //               one=false;
                    //               two=false;
                    //               tree=false;
                    //               four=false;
                    //               five=true;
                    //               six=false;
                    //               seven=false;
                    //               eight=false;
                    //               setState(() {
                    //
                    //               });
                    //             },
                    //             child:  Container(
                    //               padding: EdgeInsets.all(10),
                    //               margin: EdgeInsets.all(10),
                    //               decoration:BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(10),
                    //                 color: five ? Colors.green:Colors.grey,
                    //               ),
                    //               child: Text("05:00PM",style: TextStyle(
                    //                   color: Colors.black,
                    //                   fontSize: 12,
                    //                   fontWeight: FontWeight.bold
                    //               ),),
                    //             ),
                    //           ),
                    //           GestureDetector(
                    //             onTap: (){
                    //               one=false;
                    //               two=false;
                    //               tree=false;
                    //               four=false;
                    //               five=false;
                    //               six=true;
                    //               seven=false;
                    //               eight=false;
                    //               setState(() {
                    //
                    //               });
                    //             },
                    //             child:  Container(
                    //               padding: EdgeInsets.all(10),
                    //               margin: EdgeInsets.all(10),
                    //               decoration:BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(10),
                    //                 color: six?Colors.green:Colors.grey,
                    //               ),
                    //               child: Text("06:00PM",style: TextStyle(
                    //                   color: Colors.black,
                    //                   fontSize: 12,
                    //                   fontWeight: FontWeight.bold
                    //               ),),
                    //             ),
                    //           ),
                    //           GestureDetector(
                    //             onTap: (){
                    //               one=false;
                    //               two=false;
                    //               tree=false;
                    //               four=false;
                    //               five=false;
                    //               six=false;
                    //               seven=true;
                    //               eight=false;
                    //               setState(() {
                    //
                    //               });
                    //             },
                    //             child:  Container(
                    //               padding: EdgeInsets.all(10),
                    //               margin: EdgeInsets.all(10),
                    //               decoration:BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(10),
                    //                 color: seven ? Colors.green:Colors.grey,
                    //               ),
                    //               child: Text("07:00PM",style: TextStyle(
                    //                   color: Colors.black,
                    //                   fontSize: 12,
                    //                   fontWeight: FontWeight.bold
                    //               ),),
                    //             ),
                    //           ),
                    //           GestureDetector(
                    //             onTap: (){
                    //               one=false;
                    //               two=false;
                    //               tree=false;
                    //               four=false;
                    //               five=false;
                    //               six=false;
                    //               seven=false;
                    //               eight=true;
                    //               setState(() {
                    //
                    //               });
                    //             },
                    //             child:  Container(
                    //               padding: EdgeInsets.all(10),
                    //               margin: EdgeInsets.all(10),
                    //               decoration:BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(10),
                    //                 color: eight ? Colors.green:Colors.grey,
                    //               ),
                    //               child: Text("08:00PM",style: TextStyle(
                    //                   color: Colors.black,
                    //                   fontSize: 12,
                    //                   fontWeight: FontWeight.bold
                    //               ),),
                    //             ),
                    //           )
                    //         ],
                    //       ),
                    //       GestureDetector(
                    //         onTap: ()async {
                    //           getBooking(email.toString(),mobile.toString());
                    //         },
                    //         child:Container(
                    //           alignment: Alignment.center,
                    //           height: 50,
                    //           decoration: BoxDecoration(
                    //             color: Colors.white,
                    //             borderRadius: BorderRadius.circular(10),
                    //           ),
                    //           margin: EdgeInsets.symmetric(horizontal: 20),
                    //           child: Text("Book Now",style: TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //             color: Colors.orange
                    //           ),),
                    //         ),
                    //       ),
                    // ],
                  );
                })
          ],
        ),
      ),
    );
  }

  DateTime _selectDateTime = DateTime.now();
  Future<void> _selectedDate(BuildContext context) async {
    DateTime? _picked = await showDatePicker(
        context: context, firstDate: DateTime(2025), lastDate: DateTime(2026));
    if (_picked != null && _picked != _selectDateTime) {
      setState(() {
        _selectDateTime = _picked;
      });
    }
  }

  int track = 0;

  List<String> getFormatedDates() {
    final now = DateTime.now();
    final formatter = DateFormat("EEE d");
    return List.generate(10, (index) {
      final date = now.add(Duration(days: index));
      return formatter.format(date);
    });
  }

  String? currentDate;

  getBooking(String useremail, String usermobile) async {
    Map<String, dynamic> userBooking = {
      "UserName": name,
      "UserEmail": useremail,
      "UserMobile": usermobile,
      "Salon": widget.Name,
      "Services": isSelected,
      "Mobile": widget.Mobile,
      "Email": widget.Email,
      "Address": widget.Address,
      "approvalStatus": "pending",
      "Date":
          "${_selectDateTime.day}/${_selectDateTime.month}/${_selectDateTime.year}",
      "Time": one
          ? "01:00PM"
          : two
              ? "02:00PM"
              : tree
                  ? "03:00PM"
                  : four
                      ? "04:00PM"
                      : five
                          ? "05:00PM"
                          : six
                              ? "06:00PM"
                              : seven
                                  ? "07:00PM"
                                  : eight
                                      ? "08:00PM"
                                      : nine
                                          ? "09:00AM"
                                          : ten
                                              ? "10:00AM"
                                              : eleven
                                                  ? "11:00AM"
                                                  : "12:00PM"
    };
    await MyDatabase().addUserBooking(userBooking).then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Booked Successfully")));
      //Navigator.push(context,MaterialPageRoute
      //  (builder: (context)=>CustBookedPage()));
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CustomerBookingHistory(
                    email: useremail,
                  )));
    });
  }
}
