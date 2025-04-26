import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:salonapp/admin_pannel/adminloginscreen/admin_home_page.dart';
import 'package:salonapp/admin_pannel/adminloginscreen/admin_login_page.dart';
import 'package:salonapp/admin_pannel/all_logins.dart';
import 'package:salonapp/saloon_pannel/saloon_login.dart';
import 'package:salonapp/services/shared_preferences.dart';
import '../../customer_screen/customer_home_screen.dart';
import '../../customer_screen/login screen/firebase_services.dart';
import '../../services/database.dart';

class SaloonSignUpPage extends StatefulWidget{
  @override
  _SaloonSignUpPageState createState()=>_SaloonSignUpPageState();

}

class _SaloonSignUpPageState extends State<SaloonSignUpPage>{
  final FirebaseAuthServices _auth= FirebaseAuthServices();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  TextEditingController _usernameController=TextEditingController();
  TextEditingController _mobileNoController=TextEditingController();
  TextEditingController _salonNameController=TextEditingController();
  TextEditingController _addressController=TextEditingController();

  final _formKey=GlobalKey<FormState>();
  String? email,password,username,mobile,salonName,image,address;
  void _onSubmitAdminSignUp()async{
    String email=_emailController.text.trim();
    String password=_passwordController.text.trim();
    username=_usernameController.text.trim();
    salonName=_salonNameController.text.trim();
    address=_addressController.text.trim();

    User? user=await _auth.SignUpWithUsernAmeandPassword(email, password);
    String id= randomAlphaNumeric(10);
    await SharedprefHelper().saveAdminName(_usernameController.text);
    await SharedprefHelper().saveAdminEmail(_emailController.text);
    await SharedprefHelper().saveAdminMobNo(_mobileNoController.text);
    await SharedprefHelper().saveAdminSalonName(_salonNameController.text);
    await SharedprefHelper().saveAdminAddress(_addressController.text);
    await SharedprefHelper().saveAdminId(id);

    Map<String, dynamic>SalooninfoMap= {
      "Name":_usernameController.text,
      "Mobile":_mobileNoController.text,
      "Email":_emailController.text,
      "Address":_addressController.text,
      "Id":id,
      "SalonName":_salonNameController.text,
      "ActivationStatus":"pending",
      // "Image":"data:image/jpeg;base64,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"
      "Image":"data:image/jpeg;base64,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",
    };
    await MyDatabase().addSaloonDetails(SalooninfoMap,id);
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
              Text("Saloon Sign Up !!",
                style: TextStyle(color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),),
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
                    return "Please Enter Full Name";
                  }
                  return null;
                },
              ),

              SizedBox(height: 10,),
              TextFormField(
                controller: _salonNameController,
                decoration: InputDecoration(
                  hintText: "Salon Name",
                  prefixIcon: Icon(Icons.keyboard),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "Please Enter Username";
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
                          builder: (context)=>SaloonLoginPage()));
                    },
                    child:Text(" Go to Login",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  SizedBox(width: 5,),
                  TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>AllLogins()));
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
