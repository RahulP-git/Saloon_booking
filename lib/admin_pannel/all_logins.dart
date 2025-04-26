import 'package:flutter/material.dart';
import 'package:salonapp/admin_pannel/adminloginscreen/admin_login_page.dart';
import 'package:salonapp/customer_screen/login%20screen/cust_login_page.dart';
import 'package:salonapp/saloon_pannel/saloon_login.dart';

class AllLogins extends StatefulWidget{
  @override
  _AllLoginsState createState()=>_AllLoginsState();

}
class _AllLoginsState extends State<AllLogins>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width:  MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                elevation: 05,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>AdminLoginPage()));
                  },
                  child: Container(
                    height: 150,
                    alignment: Alignment.center,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text("Admin Login",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
              Material(
                elevation: 05,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>SaloonLoginPage()));
                  },
                  child: Container(
                    height: 150,
                    width: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text("Saloon Login",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
              Material(
                elevation: 05,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>LoginPage()));
                  },
                  child: Container(
                    height: 150,
                    width: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text("User Login",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}