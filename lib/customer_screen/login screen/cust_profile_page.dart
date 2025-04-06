import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salonapp/services/database.dart';

class CustProfilePage extends StatefulWidget{
  @override
  _CustProfilePageState createState()=>_CustProfilePageState();
}

class _CustProfilePageState extends State<CustProfilePage>{
  File? image;
 // UploadTask? uploadTask;

  TextEditingController _nameController=TextEditingController();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _mobileController=TextEditingController();
  TextEditingController _addressController=TextEditingController();
final ds=MyDatabase();
  void dispose(){
    _addressController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.green,
          child:
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            child: Form(
                child:  Column(
                children: [
                SizedBox(height: 10,),
                InkWell(
                    onTap: () async{
                      //ToDo Pick Images
                    final picture= await ImagePicker().pickImage(source: ImageSource.gallery);
                    if(picture!=null){
                      image=File(picture.path);
                      setState(() {

                      });
                    }
                    },
                  child:image==null ?
                      CircleAvatar(radius: 50,
                          child: Icon(Icons.camera_alt)):Image.file(image!),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    label: const Text("Name"),
                    hintText: "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      label: const Text("Email"),
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: _mobileController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      label: const Text("Mobile No"),
                      hintText: "Mobile No.",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      label: const Text("Address"),
                      hintText: "Address ",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CupertinoButton(
                        color: Colors.blue,
                          sizeStyle: CupertinoButtonSize.large,
                          child: Text("Create"),
                          onPressed: (){
                         final user= UserDetails(Name: _nameController.text.trim(),
                          Email: _emailController.text.trim(),
                          MobNo: _mobileController.text.trim(),
                          Address: _addressController.text.trim());
                          ds.create(user);
                          }),
                      CupertinoButton(
                          color: Colors.blue,
                          sizeStyle: CupertinoButtonSize.large,
                          child: Text("Read"),
                          onPressed: (){
                            ds.read();
                          }),
                      CupertinoButton(
                          color: Colors.blue,
                          sizeStyle: CupertinoButtonSize.large,
                          child: Text("Update"),
                          onPressed: (){
                            ds.update();
                          }),
                      CupertinoButton(
                          color: Colors.blue,
                          sizeStyle: CupertinoButtonSize.large,
                          child: Text("Delete"),
                          onPressed: (){
                            ds.delete();
                          }),
                    ],
                  )
              ],)

             ),
          )
        ),
      ),
    );
  }

}



class UserDetails{
  final String Name;
  final String Email;
  final String MobNo;
  final String Address;

  UserDetails({
    required this.Name,
    required this.Email,
    required this.Address,
    required this.MobNo,
});

}