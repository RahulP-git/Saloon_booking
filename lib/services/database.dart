import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:salonapp/customer_screen/login%20screen/cust_profile_page.dart';

class MyDatabase{
  Future addUserDetails(Map<String, dynamic> UserinfoMap, String id) async{
  return await FirebaseFirestore.instance
      .collection("users")
      .doc(id)
      .set(UserinfoMap);
  }


  //funtion to store the booking details on firebase
  Future addBooking(Map<String, dynamic> UserBookinfoMap) async{
    return await FirebaseFirestore.instance
        .collection("Booking")
        .add(UserBookinfoMap);
  }

  Future addUserBooking(Map<String, dynamic> UserBookedinfoMap) async{
    return await FirebaseFirestore.instance
        .collection("UserBooking")
        .add(UserBookedinfoMap);
  }

  Future addAdminDetails(Map<String, dynamic> AdmininfoMap, String id) async{
    return await FirebaseFirestore.instance
        .collection("Admin")
        .doc(id)
        .set(AdmininfoMap);
  }

  Future<Stream<QuerySnapshot>> getBookings() async{
    return FirebaseFirestore.instance.collection("Booking").snapshots();
  }

  Future<Stream<QuerySnapshot>> getUserBookings(String userId) async{
    return FirebaseFirestore.instance.collection("Booking").where("Services"=="Smooth Facial").snapshots();

  }

  //CRUD Operations  //Customer Profile Page
  final fire= FirebaseFirestore.instance;
  create(UserDetails user){
    try{
      fire.collection("users").add({
        "Name":user.Name,
        "Email":user.Email,
        "MobileNo":user.MobNo,
        "Address":user.Address,
      });
      print("Created SuccessFully");
    }catch(e){
 print(e.toString());

    }
  }

  read()async{
    try{
    final data= await fire.collection("users").get();
    final user=data.docs[0];
    print(user["Name"]);
    print(user["Email"]);
      print("Read SuccessFully");
    }catch(e){
      print(e.toString());

    }
  }
  update()async{
    try{
    await fire.collection("users").doc("0321159686").update({
      "Name":"Sanjay",
      "Email":"Sanjay@gmail.com",
      "MobileNo":"7655576871",
    });}
        catch(e){
      print(e.toString());
        }
  }

  getData(id)async{
    await FirebaseFirestore.instance.collection("Admin").doc(id).snapshots();

  }

  delete()async{
    try{
      await fire.collection("users").doc("0321159686").delete();
    }catch(e){
      print(e.toString());
    }
  }
}