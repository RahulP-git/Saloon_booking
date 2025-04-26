import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServices{
  FirebaseAuth _auth = FirebaseAuth.instance;
  //final GoogleSignIn(ci) _googleSignIn = GoogleSignIn();
 // final FirebaseAuth _auth = FirebaseAuth.instance;
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

//LoginWithGoogle
  Future<UserCredential?> LoginWithGoogle() async{
    try{
      final googleUser=await GoogleSignIn().signIn();
      final googleAuth=await googleUser?.authentication;
      final cred= GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
        accessToken: googleAuth?.accessToken,
      );
      return await _auth.signInWithCredential(cred);
    }on FirebaseAuthException catch(e){
      if(e.code=="User-not-found" || e.code=="Wrong Password"){
        print(e.code);
      }else{
        print(e.code);
      }
      print("Some Error Occurred");
    }
    return null;
  }
//LogOut
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      print("User logged out successfully");
      // Optionally, navigate the user to the login screen
    } catch (e) {
      print("Error logging out: $e");
    }
  }
}