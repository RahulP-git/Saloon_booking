import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:salonapp/services/shared_preferences.dart';
import '../../services/database.dart';
import '../customer_home_screen.dart';

import 'cust_login_page.dart';
import 'cust_salon_list.dart';
import 'firebase_services.dart';

class SignUpPage extends StatefulWidget{
  @override
  _SignUpPageState createState()=>_SignUpPageState();

}

class _SignUpPageState extends State<SignUpPage>{
  final FirebaseAuthServices _auth= FirebaseAuthServices();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  TextEditingController _usernameController=TextEditingController();
  TextEditingController _mobileNoController=TextEditingController();
  final _formKey=GlobalKey<FormState>();
  bool _isVisible = true; // Icon visibility
  bool _isObscure = true;
  void _toggleVisibilityAndObscureText() {
    setState(() {
      _isVisible = !_isVisible;
      _isObscure = !_isObscure;
    });
  }
  void _onSubmitSignUp()async{
    String email=_emailController.text.trim();
    String password=_passwordController.text.trim();
    String username=_usernameController.text.trim();
    String mobileno=_mobileNoController.text.trim();
    User? user=await _auth.SignUpWithUsernAmeandPassword(email, password);
    String id= randomAlphaNumeric(10);
    await SharedprefHelper().saveUserName(_usernameController.text);
    await SharedprefHelper().saveUserEmail(_emailController.text);
    await SharedprefHelper().saveMobileNo(_mobileNoController.text);
    await SharedprefHelper().saveUserImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTApHRRUflh4d2eXwN_oIMGlMVXE0Q5Z-oNJQ&s");
    await SharedprefHelper().saveUserId(id);
    Map<String, dynamic>userInfoMap= {
    "Name":_usernameController.text,
      "Email":_emailController.text,
      "Mobile":_mobileNoController.text,
      "Id":id,
      "Image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTApHRRUflh4d2eXwN_oIMGlMVXE0Q5Z-oNJQ&s"
  };
   await MyDatabase().addUserDetails(userInfoMap,id);
    if(user!=null){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(" SignIn SuccessFully !!")));
     // Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomerHomePage(userid: username)));
      Navigator.push(context, MaterialPageRoute(builder: (context)=>CustHomePage1(email:username)));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Some Error")));
    }
    _emailController.clear();
    _passwordController.clear();
    _usernameController.clear();
    _mobileNoController.clear();
  }
  void dispose(){
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _mobileNoController.clear();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
      Container(
      height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 20,left: 20,right: 20),
         margin: EdgeInsets.only(top: 60,),
         decoration: BoxDecoration(
         color: Colors.orangeAccent,
         borderRadius: BorderRadius.only
        (topRight: Radius.circular(40),
        topLeft: Radius.circular(40),
        )
        ),
          child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 10,),
                          Text("Sign Up !!",
                            style: TextStyle(color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              hintText: "Full Name",
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
                            controller: _emailController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              hintText: "Email",
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
                            controller: _mobileNoController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mobile_friendly),
                              hintText: "Mobile Number",
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value){
                              if(value==null || value.isEmpty){
                                return "Please Enter Mobile No.";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                            obscureText: _isObscure,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password),
                              hintText: "Password",
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscure ? Icons.visibility_off : Icons.visibility,
                                ),
                                onPressed: _toggleVisibilityAndObscureText,
                              ),
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
                          GestureDetector(
                            onTap: _onSubmitSignUp,
                            child: Container(
                              height: 50,
                              alignment: Alignment.center,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                // gradient: LinearGradient(
                                //     colors: [
                                //       Color(0xff540102),
                                //       //Color(0xffb24093),
                                //       Color(0xef010156),
                                //       //Color(0xef119156),
                                //     ]),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text("SignUp",
                                style: TextStyle(color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already Have An Account ? ",
                              style: TextStyle(color: Colors.black,
                              ),),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context)=>LoginPage()));
                                },
                                child:Text(" Go to Login",style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold
                                ),),
                              ),
                            ],
                          )
                        ],
                      ),
                  )),

    );
  }

}

