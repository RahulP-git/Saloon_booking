import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../services/shared_preferences.dart';
import '../customer_home_screen.dart';
import 'cust_home.dart';
import 'cust_signup_page.dart';
import 'firebase_services.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState()=>_LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  FirebaseAuthServices _auth=FirebaseAuthServices();
  TextEditingController _emailController= TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  final  _formKey =GlobalKey<FormState>();
  bool _isVisible = true; // Icon visibility
  bool _isObscure = true;
  void _toggleVisibilityAndObscureText() {
    setState(() {
      _isVisible = !_isVisible;
      _isObscure = !_isObscure;
    });
  }
  void onSubmitLogin() async {
    String email=_emailController.text.trim();
    String password=_passwordController.text.trim();
    User? user=
    await _auth.SignInWithUsernAmeandPassword(email, password);
    await SharedprefHelper().saveUserName(_emailController.text);
    await SharedprefHelper().saveUserImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTApHRRUflh4d2eXwN_oIMGlMVXE0Q5Z-oNJQ&s");
    if(_formKey.currentState!.validate()){
      setState(() {
        email=_emailController.text;
        password=_passwordController.text;
      });
    }
    if(user!=null){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successfully !!")));
      Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomerHomePage(userid: email,)));
    }else
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Some Error")));
    }
    _passwordController.clear();
    _emailController.clear();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      body:
        Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 20,left: 20,right: 20),
          decoration: BoxDecoration(
           color: Color(0xff715901),
            borderRadius: BorderRadius.circular(10),
          ),
          child:
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10,),
                    Text("Login !!",
                      style: TextStyle(color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),),
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
                      obscureText: _isObscure,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure ? Icons.visibility_off : Icons.visibility,
                          ),
                          onPressed: _toggleVisibilityAndObscureText,
                        ),
                        fillColor: Colors.white,
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return "Please Enter Password";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 03,),
                    TextButton(onPressed: (){},
                        child: Text("Forgot Password ?",
                          style: TextStyle(color: Colors.red,
                              fontWeight: FontWeight.bold),)),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: onSubmitLogin,
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xff540102),
                                //Color(0xffb24093),
                                Color(0xef010156),
                                //Color(0xef119156),
                              ]),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text("LogIn",
                          style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold),),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't Have An Account ? ",
                        style: TextStyle(
                          color: Colors.blue
                        ),),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                          },
                          child:Text(" SignUp",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),),
                        )
                      ],
                    )
                  ],
                ),
              ),
      ),
    );
  }
}