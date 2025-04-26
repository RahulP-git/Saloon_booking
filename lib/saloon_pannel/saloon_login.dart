import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:salonapp/saloon_pannel/saloon_home.dart';
import 'package:salonapp/saloon_pannel/saloon_signup.dart';
import 'package:salonapp/services/database.dart';
import '../../customer_screen/login screen/firebase_services.dart';
import '../admin_pannel/adminloginscreen/admin_signup_page.dart';


class SaloonLoginPage extends StatefulWidget{
  @override
  _SaloonLoginPageState createState()=>_SaloonLoginPageState();
}

class _SaloonLoginPageState extends State<SaloonLoginPage>{
  FirebaseAuthServices _auth=FirebaseAuthServices();
  TextEditingController _emailController= TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  bool disable=true;
  final _formKey=GlobalKey<FormState>();
  void onSubmitLogin() async {
    String email=_emailController.text.trim();
    String password=_passwordController.text.trim();
    User? user=
    await _auth.SignInWithUsernAmeandPassword(email, password);
    if(_formKey.currentState!.validate()){
      setState(() {
        email=_emailController.text;
        password=_passwordController.text;
      });
    }
    if(user!=null){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successfully !!")));
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SaloonHomePage(email: email,)));
    }else
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Some Error")));
    }
    _passwordController.clear();
    _emailController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        height: double.infinity,
        width: double.infinity,
        // padding: const EdgeInsets.only(top: 40,),
        margin: const EdgeInsets.only(top: 60,),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.orange
        ),
        child:
        Form(
          key: _formKey,
          child:
          Container(
            padding: EdgeInsets.only(top: 20,left: 20,right: 20),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10,),
                Text("Saloon Login !!",
                  style: TextStyle(color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value){
                    if( value==null||value.isEmpty){
                      return "Please Enter Email";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10,),

                GestureDetector(
                  onTap:(){
                    disable?Icon(Icons.visibility):Icon(Icons.visibility_off);
                  } ,
                  child: TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon:Icon(Icons.password),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value){
                      if( value==null||value.isEmpty){
                        return "Please Enter Email";
                      }
                      return null;
                    },
                  ),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text("LogIn",
                      style: TextStyle(color: Colors.amber,
                          fontWeight: FontWeight.bold),),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't Have An Account ?",
                      style: TextStyle(color: Colors.blue),),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SaloonSignUpPage()));
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
      ),
    );
  }

  LoginAdmin(){
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot){
      snapshot.docs.forEach((result) {
        if (result.data()['id'!= _emailController.text.trim()]) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email Id is not Correct")));
        }
        else if(result.data()['password'!=_passwordController.text.trim()]){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password is not Correct")));
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("LoginIn Successfully !!")));
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SaloonHomePage(email: _emailController.text,)));
        }
      });
    });
  }
}