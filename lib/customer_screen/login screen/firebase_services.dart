import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthServices{
  FirebaseAuth _auth = FirebaseAuth.instance;
  //SignUp
  Future<User?>SignUpWithUsernAmeandPassword(String email,String password) async{

    try {

      UserCredential credential =
      await _auth.createUserWithEmailAndPassword
        (email: email, password: password);
      return credential.user;
    }on FirebaseException catch(e){
      if(e.code=="email-already-in-use"){
        print("Email Already in Use");
      }
      else{
        print("Some Error Occured");
      }
      return null;
    }
  }
//Login
  Future<User?>SignInWithUsernAmeandPassword(String email,String password) async{
    try {

      UserCredential credential =
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      return credential.user;
    }on FirebaseException catch(e){
      if(e.code=="User-not-found"){
        print("User Not Found");
      }
      else{
        print("Some Error Occured");
      }
      return null;
    }
  }
}