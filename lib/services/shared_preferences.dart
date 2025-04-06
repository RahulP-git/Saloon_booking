import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedprefHelper {
  // save and get user Data
  static String userIdkey = "USERIDKEY";
  static String userNamekey = "USERNAMEKEY";
  static String userEmailkey = "USEREMAILKEY";
  static String userImagekey = "USERIMAGEKEY";
  static String userMobileNoKey = "USERMOBILEKEY";

  Future<bool> saveUserId(String getUserId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userIdkey, getUserId);
  }

  Future<bool> saveUserName(String getUserName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userNamekey, getUserName);
  }

  Future<bool> saveMobileNo(String getUserMobileNo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userMobileNoKey, getUserMobileNo);
  }

  Future<bool> saveUserEmail(String getUserEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userEmailkey, getUserEmail);
  }

  Future<bool> saveUserImage(String getUserImage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userImagekey, getUserImage);
  }

  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userIdkey);
  }

  Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNamekey);
  }

  Future<String?> getUserMobileNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userMobileNoKey);
  }

  Future<String?> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmailkey);
  }

  Future<String?> getUserImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userImagekey);
  }

// save and get Admin/Service Providers Data
  static String AdminIdkey = "ADMINIDKEY";
  static String AdminNamekey = "ADMINNAMEKEY";
  static String AdminEmailkey = "ADMINEMAILKEY";
  static String AdminImagekey = "ADMINIMAGEKEY";
  static String AdminMobileNoKey = "ADMINMOBILEKEY";
  static String AdminSalonNameKey="SalonName";
  static String AdminAddress="adminAddress";

  // Save Admin Details
  Future<bool> saveAdminId(String getAdminId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(AdminIdkey, getAdminId);
  }
  Future<bool> saveAdminSalonName(String getAdminSalonName) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(AdminSalonNameKey, getAdminSalonName);
  }
  Future<bool> saveAdminAddress(String getAdminaddress) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(AdminAddress, getAdminaddress);
  }

  Future<bool> saveAdminName(String getAdminName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(AdminNamekey, getAdminName);
  }

  Future<bool> saveAdminEmail(String getAdminEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(AdminEmailkey, getAdminEmail);
  }

  Future<bool> saveAdminMobNo(String getAdminMobNo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(AdminMobileNoKey, getAdminMobNo);
  }

  Future<bool> saveAdminImage(String getAdminImage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(AdminImagekey, getAdminImage);
  }

  // get the Admin Details

Future<String?>getAdminId()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    return prefs.getString(AdminIdkey);
}

  Future<String?>getAdminSalonName()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    return prefs.getString(AdminSalonNameKey);
  }

  Future<String?>getAdminAddress()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    return prefs.getString(AdminAddress);
  }
Future<String?>getAdminName()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.getString(AdminNamekey);
}

Future<String?>getAdminEmail()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.getString(AdminEmailkey);
}

Future<String?>getAdminImage()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.getString(AdminImagekey);
}

Future<String?>getAdminMobNo()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.getString(AdminMobileNoKey);
}
}