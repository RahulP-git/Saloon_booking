import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:salonapp/admin_pannel/adminloginscreen/admin_home_page.dart';
import 'package:salonapp/admin_pannel/adminloginscreen/admin_login_page.dart';
import 'package:salonapp/services/shared_preferences.dart';
import '../../customer_screen/customer_home_screen.dart';
import '../../customer_screen/login screen/firebase_services.dart';
import '../../services/database.dart';

class AdminSignUpPage extends StatefulWidget{
  @override
  _AdminSignUpPageState createState()=>_AdminSignUpPageState();

}

class _AdminSignUpPageState extends State<AdminSignUpPage>{
  final FirebaseAuthServices _auth= FirebaseAuthServices();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  TextEditingController _usernameController=TextEditingController();
  TextEditingController _mobileNoController=TextEditingController();
  TextEditingController _addressController=TextEditingController();

  final _formKey=GlobalKey<FormState>();
  String? email,password,username,mobile,salonName,image,address;
  void _onSubmitAdminSignUp()async{
    String email=_emailController.text.trim();
    String password=_passwordController.text.trim();
     username=_usernameController.text.trim();
     address=_addressController.text.trim();

    User? user=await _auth.SignUpWithUsernAmeandPassword(email, password);
    String id= randomAlphaNumeric(10);
    await SharedprefHelper().saveAdminName(_usernameController.text);
    await SharedprefHelper().saveAdminEmail(_emailController.text);
    await SharedprefHelper().saveAdminMobNo(_mobileNoController.text);
   // await SharedprefHelper().saveAdminSalonName(_salonNameController.text);
    await SharedprefHelper().saveAdminAddress(_addressController.text);
    await SharedprefHelper().saveAdminId(id);

    Map<String, dynamic>AdmininfoMap= {
      "Name": _usernameController.text,
      "Mobile": _mobileNoController.text,
      "Email": _emailController.text,
      "Address": _addressController.text,
      "Id": id,
    };
   await MyDatabase().addAdminDetails(AdmininfoMap,id);
   if(_formKey.currentState!.validate()){
     setState(() {
       email=_emailController.text.trim();
       password=_passwordController.text.trim();
       mobile=_mobileNoController.text.trim();
       username=_usernameController.text.trim();
     });
   }
    if(user!=null){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(" SignIn SuccessFully !!")));
      Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminHomePage(email: email,)));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Some Error")));
    }
    _emailController.clear();
    _passwordController.clear();
    _usernameController.clear();
    _mobileNoController.clear();
   // _salonNameController.clear();
  }
  void dispose(){
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _mobileNoController.dispose();
   // _salonNameController.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
      Container(
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 20,),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.orange
          ), child:
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
              child: Form(
                key: _formKey,
                child: 
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10,),
                      Text("Admin Sign Up !!",
                        style: TextStyle(color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          hintText: "Admin Name",
                          prefixIcon: Icon(Icons.keyboard),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return "Please Enter Name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: _mobileNoController,
                        decoration: InputDecoration(
                  
                          hintText: "Mobile No.",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return "Please Enter Mobile No";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: _addressController,
                        maxLines: 3,

                        decoration: InputDecoration(
                          hintText: "Address",
                          filled: true,
                          prefixIcon: Icon(Icons.location_on),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return "Please Enter Email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.email),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return "Please Enter Email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          hintText: "Password",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return "Please Enter password";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: _onSubmitAdminSignUp,
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: Text("SignUp",
                            style: TextStyle(color: Colors.amber,
                            fontWeight: FontWeight.bold),),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already Have An Account ? ",
                          style: TextStyle(color: Colors.blue),),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context)=>AdminLoginPage()));
                            },
                            child:Text(" Go to Login",style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                          SizedBox(width: 5,),
                          TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (
                                  context)=>CustHomePage1(email: email.toString(),)));
                            },
                            child: Text("Goto User Home",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),))
                        ],
                      )
                    ],
                  ),
                ),
            )
        ),

    );
  }

}
